import Config from '../config.mjs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustArray,
	RustFunction,
	RustFunctionArgument,
	RustFunctionReturnValue,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant,
	RustPrimitiveWrapper,
	RustResult,
	RustResultValueEnum,
	RustStruct,
	RustStructField,
	RustTaggedValueEnum,
	RustTrait,
	RustTuple,
	RustType,
	RustVector
} from '../rust_types.mjs';
import * as path from 'path';
import * as fs from 'fs';
import Generator, {AuxiliaryArtifacts} from './index.mjs';

/**
 * Generates just one individual type. Each kind has its own implementation.
 */
export abstract class BaseTypeGenerator<Type extends RustType> {

	protected config: Config;
	protected auxiliaryArtifacts: AuxiliaryArtifacts;

	constructor(config: Config, auxiliaryArtifacts: AuxiliaryArtifacts) {
		this.config = config;
		this.auxiliaryArtifacts = auxiliaryArtifacts;
	}

	/**
	 *
	 * @param type
	 */
	generate(type: Type) {
		const fileContents = this.generateFileContents(type);
		this.persist(type, fileContents);
	}

	/**
	 *
	 * @param type
	 */
	abstract generateFileContents(type: Type): string;

	protected abstract outputDirectorySuffix(): string;

	protected swiftTypeName(type: RustType): string {
		if (type instanceof RustPrimitive) {
			return type.swiftRawSignature;
		}
		const typeName = type.name;
		if (typeName && typeName.startsWith('LDK')) {
			const ldkLessTypeName = typeName.substring('LDK'.length);
			if (ldkLessTypeName.charAt(0) === 'C') {
				if (ldkLessTypeName.startsWith('C2Tuple_') || ldkLessTypeName.startsWith('C3Tuple_')) {
					return ldkLessTypeName.substring(2);
				}

				const secondCharacter = ldkLessTypeName.charAt(1);
				if (secondCharacter === secondCharacter.toUpperCase()) {
					// it's probably an LDKCVec or LDKCResult or something like that
					return ldkLessTypeName.substring(1);
				}

			}

			// an exception due to Swift reserved keywords
			if (ldkLessTypeName === 'Type') {
				return 'BindingsType';
			} else if (ldkLessTypeName === 'Error') {
				return 'BindingsError';
			} else if (ldkLessTypeName === 'Init') {
				return 'BindingsInit';
			}

			return ldkLessTypeName;
		}
		throw new Error('Rust type names should always start with LDK');
	}

	protected hasFreeMethod(type: RustType): boolean {
		return this.hasMethod(type, 'free');
	}

	protected hasCloneMethod(type: RustType): boolean {
		return this.hasMethod(type, 'clone');
	}

	protected hasOwnershipField(type: RustType): boolean {
		if (type instanceof RustStruct) {
			if (type.ownershipField) {
				return true;
			}
		}
		return false;
	}

	protected persist(type: RustType, fileContents: string) {
		const outputPath = this.outputFilePath(type);
		const outputDirectory = path.dirname(outputPath);
		fs.mkdirSync(outputDirectory, {recursive: true});
		fs.writeFileSync(outputPath, fileContents, {});
	}

	protected generateAccessor(field: RustStructField, containerType: RustType): string {
		if (field.type instanceof OpaqueRustStruct) {
			// this should not be exposed
			return '';
		}

		let accessorName = 'get' + Generator.snakeCaseToCamelCase(field.contextualName, true);
		if (field.contextualName.startsWith('is') && field.type instanceof RustPrimitive && field.type.swiftRawSignature === 'Bool') {
			// this is just a flag
			accessorName = Generator.snakeCaseToCamelCase(field.contextualName);
		}

		const swiftReturnType = this.getPublicTypeSignature(field.type, containerType);
		const fieldAccessor = `self.cType!.${field.contextualName}`;
		const preparedReturnValue = this.prepareRustReturnValueForSwift(field, containerType);

		return `
					${this.renderDocComment(field.documentation, 5)}
					public func ${accessorName}() -> ${swiftReturnType} {
						// return value (do some wrapping)
						let returnValue = ${preparedReturnValue.wrapperPrefix}${fieldAccessor}${preparedReturnValue.wrapperSuffix}

						return returnValue;
					}
		`;
	}

	protected generateMethod(method: RustFunction, containerType?: RustType, forceStaticConstructor = false): string {

		const swiftMethodName = this.swiftMethodName(method, containerType, forceStaticConstructor);
		let swiftMethodArguments = [];
		let nativeCallValueAccessors = [];
		let isInstanceMethod = false;

		let nativeCallPrefix = '';
		let nativeCallWrapperPrefix = '', nativeCallWrapperSuffix = '';
		let nativeCallSuffix = '';

		const semantics = this.methodSemantics(method, containerType);
		if (semantics.isConstructor && forceStaticConstructor) {
			semantics.isStatic = true;
		}

		const nonCloneableArguments = [];

		for (const currentArgument of method.arguments) {
			if (currentArgument.type instanceof RustPrimitive) {
				if (currentArgument.type.swiftRawSignature === 'Void' && !currentArgument.contextualName) {
					// this is an absolutely wild exception where an argument is unnamed
					// it's not supposed to happen, but if it's void, for some reason it somehow does
					continue;
				}
			}

			let isInstanceArgument = false;
			if (currentArgument.type === containerType && !semantics.isStatic) {
				isInstanceMethod = true;
				isInstanceArgument = true;
			}

			const swiftArgumentName = Generator.snakeCaseToCamelCase(currentArgument.contextualName);
			const swiftArgumentType = this.getPublicTypeSignature(currentArgument.type, containerType, currentArgument);
			if (!isInstanceArgument) {
				swiftMethodArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);
			}

			if (!this.hasCloneMethod(currentArgument.type) && !currentArgument.isAsteriskPointer && !semantics.isFreeMethod && !this.isElidedType(currentArgument.type) && !(currentArgument.type instanceof RustTrait) && this.hasFreeMethod(currentArgument.type)) {
				if (isInstanceArgument) {
					nonCloneableArguments.push('self');
				} else {
					nonCloneableArguments.push('`' + swiftArgumentName + '`');
				}
			}

			const preparedArgument = this.prepareSwiftArgumentForRust(currentArgument, containerType, semantics);
			nativeCallPrefix += preparedArgument.conversion;
			nativeCallWrapperPrefix += preparedArgument.methodCallWrapperPrefix;
			nativeCallWrapperSuffix += preparedArgument.methodCallWrapperSuffix;
			nativeCallValueAccessors.push(preparedArgument.accessor);
			nativeCallSuffix += preparedArgument.deferredCleanup;
		}

		let cloneabilityDeprecationWarning = '';
		if (nonCloneableArguments.length > 0) {
			// not true yet
			console.log(`Method passes non-cloneable arguments by value: ${method.name} (${nonCloneableArguments.join(', ')})`);
			cloneabilityDeprecationWarning = `\n\t\t\t\t\t@available(*, deprecated, message: "This method passes the following non-cloneable, but freeable objects by value: ${nonCloneableArguments.join(', ')}.")`;
		}

		// don't mark return types from C as optional because they will be automatically force-unwrapped
		// for some inexplicable reason
		const returnType = method.returnValue.type;
		let swiftReturnType = this.getPublicTypeSignature(returnType, containerType);

		// TODO: THIS IS ABSOLUTELY INSANE AND DANGEROUS! BUG MATT UNTIL IT'S A NULLABLE OPTION!
		const isCommentDeducedNullablePointer = method.documentation.includes('Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None');
		if (isCommentDeducedNullablePointer && !swiftReturnType.endsWith('?')) {
			swiftReturnType += '?';
		}

		const isNullablePointer = method.returnValue.isAsteriskPointer && !method.returnValue.isNonnullablePointer;
		if (isNullablePointer && !swiftReturnType.endsWith('?')) {
			swiftReturnType += '?';
		}

		const returnTypeInfix = (swiftReturnType === 'Void' || swiftMethodName === 'init') ? '' : `-> ${swiftReturnType} `;

		const staticInfix = isInstanceMethod ? '' : 'class ';
		let visibility = 'public';
		if (swiftMethodName === 'free' || swiftMethodName === 'clone') {
			visibility = 'internal';
		}

		let methodDeclarationKeywords = `${visibility} ${staticInfix}func`;
		let returnCommand = 'return returnValue';
		let returnValueHandlingPrefix = '';
		let returnValueHandlingSuffix = '';
		if (swiftMethodName === 'init') {
			// it's a constructor
			methodDeclarationKeywords = visibility;
			returnCommand = `
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			`;

			returnValueHandlingPrefix = '/*';
			returnValueHandlingSuffix = '*/';
		}

		const preparedReturnValue = this.prepareRustReturnValueForSwift(method.returnValue, containerType, semantics);

		if (method.returnValue.isAsteriskPointer) {
			nativeCallSuffix += `
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			`;
		}

		if (isCommentDeducedNullablePointer) {
			nativeCallSuffix += `
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: ${returnType.constructor.name}
				// Type: ${returnType.name}
			`;

			if (returnType instanceof RustPrimitiveWrapper) {
				const dataField = returnType.dataField;
				if (dataField.type instanceof RustArray && dataField.type.iteratee instanceof RustPrimitive && Number.isFinite(dataField.type.length)) {
					this.auxiliaryArtifacts.addTuple(dataField.type.iteratee.swiftRawSignature, dataField.type.length!);
					const tupleTypeName = this.getRawTypeName(dataField.type);
					nativeCallSuffix += `
						if nativeCallResult.${dataField.contextualName} == Bindings.arrayTo${tupleTypeName}(array: [${dataField.type.iteratee.swiftRawSignature}](repeating: 0, count: ${dataField.type.length})) {
							return nil
            			}
					`;
				} else {
					throw new Error(`Unhandled comment-deduced optional inference and handling: ${containerType?.typeDescription}::${swiftMethodName} -> ${returnType.typeDescription}`);
				}
			} else if (returnType instanceof RustStruct && returnType.fields['inner'] instanceof RustStructField) {
				nativeCallSuffix += `
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				`;
			} else {
				throw new Error(`Unhandled comment-deduced optional inference and handling: ${containerType?.typeDescription}::${swiftMethodName} -> ${returnType.typeDescription}`);
			}
		}

		if (containerType instanceof RustStruct && containerType.ownershipField && swiftMethodName === 'init') {
			nativeCallSuffix += `
				self.initialCFreeability = nativeCallResult.${containerType.ownershipField.contextualName}
			`;
		}

		return `
					${this.renderDocComment(method.documentation, 5)}${cloneabilityDeprecationWarning}
					${methodDeclarationKeywords} ${swiftMethodName}(${swiftMethodArguments.join(', ')}) ${returnTypeInfix}{
						// native call variable prep
						${nativeCallPrefix}

						// native method call
						let nativeCallResult = ${nativeCallWrapperPrefix}${method.name}(${nativeCallValueAccessors.join(', ')})${nativeCallWrapperSuffix}

						// cleanup
						${nativeCallSuffix}

						${returnValueHandlingPrefix}
						// return value (do some wrapping)
						let returnValue = ${preparedReturnValue.wrapperPrefix}nativeCallResult${preparedReturnValue.wrapperSuffix}
						${returnValueHandlingSuffix}

						${returnCommand}
					}
		`;
	}

	protected standaloneMethodName(method: RustFunction, containerType: RustType): string {
		let typeNamePrefix = containerType.name;
		if (typeNamePrefix && typeNamePrefix.startsWith('LDK')) {
			typeNamePrefix = typeNamePrefix.substring('LDK'.length);
		}
		return method.name.replace(typeNamePrefix + '_', '');
	}

	protected standaloneLambdaName(lambda: RustLambda, containerType: RustType): string {
		let typeNamePrefix = containerType.name;
		if (typeNamePrefix && typeNamePrefix.startsWith('LDK')) {
			typeNamePrefix = typeNamePrefix.substring('LDK'.length);
		}
		return lambda.name.replace(typeNamePrefix + '_', '');
	}

	protected methodSemantics(method: RustFunction, containerType?: RustType): MethodSemantics {
		const semantics: MethodSemantics = {
			isCloneMethod: false,
			isConstructor: false,
			isFreeMethod: false,
			isStatic: false,
			isValueAccessor: false,
			needsInstancePointer: false
		};

		if (!containerType) {
			semantics.isStatic = true;
			return semantics;
		}

		const standaloneMethodName = this.standaloneMethodName(method, containerType);
		const returnsInstance = method.returnValue.type === containerType;
		const argumentTypes = method.arguments.map(a => a.type);
		if (!argumentTypes.includes(containerType)) {
			if (returnsInstance) {
				semantics.isConstructor = true;
			} else {
				semantics.isStatic = true;
			}
		} else {
			if (standaloneMethodName === 'eq') {
				semantics.isStatic = true;
			} else {
				for (const currentArgument of method.arguments) {
					if (currentArgument.type === containerType) {
						semantics.needsInstancePointer = currentArgument.isAsteriskPointer;
						break;
					}
				}

				if (standaloneMethodName === 'free') {
					semantics.isFreeMethod = true;
				} else if (standaloneMethodName === 'clone' && returnsInstance) {
					semantics.isCloneMethod = true;
				}
			}
		}
		return semantics;
	}

	protected swiftMethodName(method: RustFunction, containerType?: RustType, forceStaticConstructor = false): string {
		let standaloneMethodName = method.name;
		if (containerType) {
			standaloneMethodName = this.standaloneMethodName(method, containerType);
			const semantics = this.methodSemantics(method, containerType);
			// complex enums may have multiple variants of the same type, so those initializers should be static
			if (semantics.isConstructor && !['clone', 'none', 'start'].includes(standaloneMethodName)) {
				if (forceStaticConstructor || standaloneMethodName !== 'new') {
					// if the method name isn't new, we want an `initWith` name. For now.
					const suffix = Generator.snakeCaseToCamelCase(standaloneMethodName, true);
					if (suffix.startsWith('From')) {
						// example: fromPubkey -> initWithPubkey
						return 'initWith' + suffix.substring(4);
					}
					if (suffix.startsWith('New')) {
						// example: NewP2wpkh -> initWithP2wpkh
						return 'initWith' + suffix.substring(3);
					}
					if (suffix.startsWith('For')) {
						// example: forKeysend -> initForKeysend
						return 'init' + suffix;
					}
					return 'initWith' + suffix;
				}
				return 'init';
			}
			return Generator.snakeCaseToCamelCase(standaloneMethodName);
		}
		return 'swift' + Generator.snakeCaseToCamelCase(standaloneMethodName, true);
	}

	/**
	 * These are types that technically have Swift wrappers, but that are never exposed to the user
	 * @param type
	 * @protected
	 */
	protected isElidedType(type: RustType): boolean {
		if (type instanceof RustNullableOption || type instanceof RustPrimitiveWrapper || type instanceof RustVector) {
			return true;
		}
		if (type instanceof RustArray) {
			// these are all the tuples
			if (type.iteratee instanceof RustPrimitive) {
				return true;
			}
		}
		if (type instanceof RustTuple) {
			return true;
		}

		return false;
	}

	/**
	 * Some types have multiple constructors but with the same argument types
	 * We wanna allow init-based construction by default, but when the types conflict,
	 * we'll use explicitly named static initializers instead
	 * @param type
	 * @protected
	 */
	protected collectConflictingConstructors(type: RustType): Set<RustFunction> {
		const constructorArgumentSignatureCounter: { [signature: string]: RustFunction[] } = {};
		const conflictingArgumentConstructors = new Set<RustFunction>();
		for (const currentMethod of type.methods) {
			// is it a constructor?

			const standaloneMethodName = this.standaloneMethodName(currentMethod, type);
			if (currentMethod.returnValue.type !== type || ['clone'].includes(standaloneMethodName)) {
				// it's a constructor all right
				continue;
			}

			let typeSignatures = [];
			for (const currentArgument of currentMethod.arguments) {
				typeSignatures.push(this.getPublicTypeSignature(currentArgument.type, type));
			}

			const typeSignature = typeSignatures.join(', ');

			if (!constructorArgumentSignatureCounter[typeSignature]) {
				constructorArgumentSignatureCounter[typeSignature] = [currentMethod];
			} else {
				conflictingArgumentConstructors.add(constructorArgumentSignatureCounter[typeSignature][0]);
				conflictingArgumentConstructors.add(currentMethod);
				constructorArgumentSignatureCounter[typeSignature].push(currentMethod);
			}
		}

		return conflictingArgumentConstructors;
	}

	/**
	 *
	 * @param type
	 * @param containerType
	 * @param context Pretty much never needs to be passed in except for trait Swift callback arguments
	 * @protected
	 */
	protected getPublicTypeSignature(type: RustType, containerType?: RustType, context?: ContextualRustType): string {
		let isTypeElided = this.isElidedType(type);
		const isTypeCurrentContainerType = (type === containerType);
		if (isTypeCurrentContainerType) {
			// even if the type is elided, it isn't within the context of its own internals
			return this.swiftTypeName(type);
		}

		let nullabilitySuffix = '';
		if (context && this.isPointerArgumentNullable(context as RustFunctionArgument, containerType)) {
			// we're dealing with a pointer here, which means nullability is possible
			// however, if it's just a vector's field or a string's field, it doesn't mean
			// it should be nullable
			nullabilitySuffix = '?';
		}

		if (!isTypeElided) {
			if (type.parentType && type.parentType === containerType) {
				if (type instanceof RustStruct && containerType instanceof RustTaggedValueEnum) {
					const regex = new RegExp(`^${containerType.name}_LDK(.*)_Body$`);
					const matches = regex.exec(type.name);
					if (Array.isArray(matches)) {
						const abbreviatedName = matches[1];
						/**
						 * BUT WAIT! Is there already a type with the same name? Stranger
						 * things have happened!
						 */
						return matches[1];
					}
				}
			}

			if (containerType instanceof RustTaggedValueEnum && type instanceof RustStruct) {
				// this is because of NetAddress.swift
				return `Bindings.${this.swiftTypeName(type)}`;
			}

			if (type instanceof RustStruct && containerType instanceof RustStruct && containerType.parentType instanceof RustTaggedValueEnum) {
				// this is because of NetAddress.swift
				return `Bindings.${this.swiftTypeName(type)}`;
			}

			return this.swiftTypeName(type);
		}

		if (type instanceof RustNullableOption) {
			// this becomes a native Swift nullable that we're gonna unwrap or construct,
			// depending on the context
			nullabilitySuffix = '?';

			const someVariantTypeName = this.getPublicTypeSignature(type.someVariant.type);
			// TODO: if outer context already implies a Nullable, find way to avoid `??`
			return someVariantTypeName + nullabilitySuffix;
		}

		if (type instanceof RustPrimitiveWrapper) {
			if (type.dataField.type instanceof RustPrimitive) {
				if (type.dataField.isConstant && type.dataField.isAsteriskPointer) {
					if (type.name === 'LDKStr') {
						return 'String' + nullabilitySuffix;
					} else {
						// throw new Error(`Unmapped primitive wrapper with \`const *\` data field: ${type.name}`);
						return `[${type.dataField.type.swiftRawSignature}]${nullabilitySuffix}`;
					}
				} else if (type.dataField.isAsteriskPointer) {
					return `[${type.dataField.type.swiftRawSignature}]${nullabilitySuffix}`;
				}
				return type.dataField.type.swiftRawSignature;
			} else if (type.dataField.type instanceof RustArray) {
				const iteratee = type.dataField.type.iteratee as RustPrimitive;
				return `[${iteratee.swiftRawSignature}]${nullabilitySuffix}`;
			}
		}

		if (type instanceof RustArray) {
			if (type.iteratee instanceof RustPrimitive) {
				return `[${type.iteratee.swiftRawSignature}]${nullabilitySuffix}`;
			}
		}

		if (type instanceof RustVector) {
			const iterateeTypeName = this.getPublicTypeSignature(type.iterateeField.type);
			return `[${iterateeTypeName}]${nullabilitySuffix}`;
		}

		if (type instanceof RustTuple) {
			let subTypes = [];
			for (const currentField of type.orderedFields) {
				subTypes.push(this.getPublicTypeSignature(currentField.type));
			}
			return `(${subTypes.join(', ')})`;
		}

		throw new Error(`Unmapped elided type: ${type.typeDescription}`);
	}

	/**
	 * The type name that the Swift compiler natively maps C types into.
	 * For some repeated types like tuples we add aliasing, and register the tuple
	 * as needing conversion in the auxiliary artifact tracker.
	 * @param type
	 * @protected
	 */
	protected getRawTypeName(type: RustType) {
		if (type instanceof RustPrimitive) {
			return type.swiftRawSignature;
		}

		if (type instanceof RustArray) {
			if (type.iteratee instanceof RustPrimitive && Number.isFinite(type.length)) {
				// inlining a really long tuple would be rather ugly, so instead we're gonna
				// declare a type for it and generate some auxiliary conversion and typealiasing
				// artifacts
				this.auxiliaryArtifacts.addTuple(type.iteratee.swiftRawSignature, type.length!);
				return `${type.iteratee.swiftRawSignature}Tuple${type.length}`;
			}

			throw new Error(`Unnamed raw type: ${type.typeDescription}`);
		}

		const typeName = type.name;
		if (!typeName) {
			throw new Error('Unnamed type of kind ' + type.constructor.name);
		}
		return typeName;
	}

	protected prepareSwiftArgumentForRust(argument: RustFunctionArgument, containerType?: RustType, memoryContext?: MethodSemantics): PreparedArgument {
		// this is the name of the variable that the method receives
		const publicName = Generator.snakeCaseToCamelCase(argument.contextualName);
		const preparedArgument: PreparedArgument = {
			// this is the name of the variable that we end up passing to Rust
			// by default, it's unchanged
			name: publicName,

			// this is the string that we pass to the native method
			// usually, it's just the name of the variable, but can contain additional access
			accessor: publicName,

			conversion: '',

			methodCallWrapperPrefix: '',
			methodCallWrapperSuffix: '',

			deferredCleanup: ''
		};

		// this argument is the content of an elided container, like the iteratee of a Vec
		let isElidedContainerContent = false;
		if (containerType && this.isElidedType(containerType)) {
			// determine whether this is an initialization of that container
			if (containerType instanceof RustVector) {
				if (argument.type === containerType.iterateeField.type || argument.type === containerType.deepestIterateeType) {
					isElidedContainerContent = true;
				}
			} else if (containerType instanceof RustNullableOption) {
				if (argument.type === containerType.someVariant.type) {
					isElidedContainerContent = true;
				}
			} else if (containerType instanceof RustTuple) {
				const tupleContentTypes = containerType.orderedFields.map(f => f.type);
				if (tupleContentTypes.includes(argument.type)) {
					isElidedContainerContent = true;
				}
			}
		}

		/**
		 * TODO: explain
		 * TODO: find out, such that I'm able to explain
		 */
		let isOwnershipFieldSafelyEditable = false;
		if (argument.type instanceof RustPrimitiveWrapper) {
			// isOwnershipFieldSafelyEditable = true;
		} else if (argument.type.name === 'LDKChannelMonitor' && isElidedContainerContent) {
			isOwnershipFieldSafelyEditable = true;
		}

		let memoryManagementInfix = '';
		if (!(argument.type instanceof RustTrait) && this.hasFreeMethod(argument.type)) {

			if (argument.type === containerType) {
				// normally, we don't really wanna do anything here
				if (!this.hasCloneMethod(argument.type) && !this.isElidedType(argument.type) && !argument.isAsteriskPointer && memoryContext && !memoryContext.isFreeMethod) {
					// except when the argument isn't cloneable, and it's not elided, and it's passed by value, in which case we dangle
					memoryManagementInfix = '.dangle()';
				} else if (this.hasCloneMethod(argument.type) && argument.isAsteriskPointer && memoryContext && !memoryContext?.isFreeMethod && !memoryContext.isCloneMethod) {
					// if it's being passed as a pointer, we need to clone the object and forget about it
					// memoryManagementInfix = '.danglingClone()'
				} else if (this.hasCloneMethod(argument.type) && !argument.isAsteriskPointer && memoryContext && !memoryContext?.isFreeMethod) {
					if (argument.type instanceof RustStruct && argument.type.ownershipField) {
						memoryManagementInfix = '.dynamicallyDangledClone()';
					} else {
						memoryManagementInfix = '.danglingClone()';
					}
				}
			} else if (this.hasCloneMethod(argument.type) && !argument.isAsteriskPointer) {
				if (argument.type instanceof RustStruct && argument.type.ownershipField) {
					memoryManagementInfix = '.dynamicallyDangledClone()';
					if (isOwnershipFieldSafelyEditable) {
						// normally we wanna avoid it, except for LDKChannelMonitors
						// memoryManagementInfix = '.clone().setCFreeability(freeable: false)';
						memoryManagementInfix = '.setCFreeability(freeable: false)';
						preparedArgument.deferredCleanup = `
							${preparedArgument.name}.cType!.${argument.type.ownershipField.contextualName} = ${preparedArgument.name}.initialCFreeability
						`;
					}
				} else {
					// we have to assume that Rust will just eat this type
					memoryManagementInfix = '.danglingClone()';
				}
			} else if (!argument.isAsteriskPointer) {
				// just gotta hope for the best
				memoryManagementInfix = '.dangle()';
				if (isOwnershipFieldSafelyEditable && this.hasOwnershipField(argument.type)) {
					// normally we wanna avoid it, except for LDKChannelMonitors
					// memoryManagementInfix = '.setCFreeability(freeable: false)';
					// if(argument.type instanceof RustPrimitiveWrapper && memoryContext && !memoryContext.isValueAccessor){
					// memoryManagementInfix = ''
					// }
				}
			}
		} else if (argument.type instanceof RustPrimitiveWrapper && argument.type.isDeallocatable()) {
			// memoryManagementInfix = '.dangle()';
		}

		if (argument.type === containerType && !(memoryContext && memoryContext.isStatic)) {
			// we're passing self
			preparedArgument.accessor = `self${memoryManagementInfix}.cType!`;
		} else {
			// these type elision helpers only apply outside the context of the very eliding type
			if (argument.type instanceof RustNullableOption) {
				preparedArgument.name += 'Option';
				// TODO: figure out when label should be `some: `
				preparedArgument.conversion += `
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(some: ${publicName})${memoryManagementInfix}
				`;
				preparedArgument.accessor = preparedArgument.name + '.cType!';
			} else if (argument.type instanceof RustTuple) {
				preparedArgument.name += 'Tuple';
				preparedArgument.conversion += `
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(tuple: ${publicName})${memoryManagementInfix}
				`;
				preparedArgument.accessor = preparedArgument.name + '.cType!';
			} else if (argument.type instanceof RustPrimitiveWrapper) {
				preparedArgument.name += 'PrimitiveWrapper';
				preparedArgument.conversion += `
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(value: ${publicName})${memoryManagementInfix}
				`;
				if (argument.type.ownershipField) {
					/* preparedArgument.conversion += `
						${preparedArgument.name}.cType!.${argument.type.ownershipField!.contextualName} = false
					`; */
				}
				preparedArgument.deferredCleanup += `
						// for elided types, we need this
						${preparedArgument.name}.noOpRetain()
				`;
				preparedArgument.accessor = preparedArgument.name + '.cType!';
			} else if (argument.type instanceof RustVector) {
				preparedArgument.name += 'Vector';
				preparedArgument.conversion += `
						let ${preparedArgument.name} = ${this.swiftTypeName(argument.type)}(array: ${publicName})${memoryManagementInfix}
				`;
				// figure out when it needs to be dangled
				preparedArgument.accessor = preparedArgument.name + '.cType!';
				preparedArgument.deferredCleanup += `
						// ${preparedArgument.name}.noOpRetain()
				`;
			} else if (argument.type instanceof RustTrait) {
				preparedArgument.accessor = preparedArgument.name + '.activate().cType!';
			} else if (argument.type instanceof RustStruct || argument.type instanceof RustTaggedValueEnum || argument.type instanceof RustResult) {
				preparedArgument.accessor = preparedArgument.name + `${memoryManagementInfix}.cType!`;
			} else if (argument.type instanceof RustPrimitiveEnum) {
				preparedArgument.accessor = preparedArgument.name + '.getCValue()';
			} else if (argument.type instanceof RustArray) {
				const iteratee = argument.type.iteratee;
				if (iteratee instanceof RustPrimitive && Number.isFinite(argument.type.length)) {
					// inlining a really long tuple would be rather ugly, so instead we're gonna
					// declare a type for it and generate some auxiliary conversion and typealiasing
					// artifacts
					const tupleTypeName = this.getRawTypeName(argument.type);
					preparedArgument.name = `tupled${Generator.snakeCaseToCamelCase(preparedArgument.name, true)}`;
					this.auxiliaryArtifacts.addTuple(iteratee.swiftRawSignature, argument.type.length!);
					preparedArgument.conversion += `
						let ${preparedArgument.name} = Bindings.arrayTo${tupleTypeName}(array: ${preparedArgument.accessor})
					`;
					preparedArgument.accessor = preparedArgument.name;
				}
			} else if (argument.type instanceof RustPrimitive) {
				// nothing to do here
			} else {
				throw new Error(`Unsupported native argument type: ${argument.type.typeDescription}`);
			}

		}

		if (argument.isAsteriskPointer) {
			// we must wrap the native call in a withUnsafePointer component
			const typeName = this.getRawTypeName(argument.type);
			const mutabilityInfix = argument.isConstant ? '' : 'Mutable';

			// TODO: figure out when exactly this is necessary. Seems to be 1:1 with mutable, but not sure yet
			const inoutAmpersandInfix = argument.isConstant ? '' : '&';

			if (this.isPointerArgumentNullable(argument, containerType)) {
				// TODO: remove the RustTrait restriction
				preparedArgument.conversion = `
					var ${preparedArgument.name}Pointer: UnsafeMutablePointer<${typeName}>? = nil
					if let ${publicName} = ${publicName} {
						${preparedArgument.conversion}
						${preparedArgument.name}Pointer = UnsafeMutablePointer<${typeName}>.allocate(capacity: 1)
						${preparedArgument.name}Pointer!.initialize(to: ${preparedArgument.accessor})
					}
				`;
				preparedArgument.name += 'Pointer';
				preparedArgument.accessor = preparedArgument.name;
			} else {
				preparedArgument.name += 'Pointer';
				preparedArgument.methodCallWrapperPrefix += `
						withUnsafe${mutabilityInfix}Pointer(to: ${inoutAmpersandInfix}${preparedArgument.accessor}) { (${preparedArgument.name}: Unsafe${mutabilityInfix}Pointer<${typeName}>) in
				`;
				preparedArgument.methodCallWrapperSuffix += `
						}
				`;

				// the wrapper accesses the variable normally, and introduces a new variable name by which to refer to the value
				preparedArgument.accessor = preparedArgument.name;
			}

		}

		return preparedArgument;
	}

	protected prepareRustReturnValueForSwift(returnType: ContextualRustType, containerType?: RustType, memoryContext?: MethodSemantics): PreparedReturnValue {
		const preparedReturnValue: PreparedReturnValue = {
			wrapperPrefix: '',
			wrapperSuffix: ''
		};

		if (returnType.isAsteriskPointer) {
			preparedReturnValue.wrapperSuffix += '.pointee';
		}

		/**
		 * If we have recursive ownership flag, we still need the anchor, but we don't need
		 * to dangle the return type. TODO: add support for undangled anchors.
		 */
		const hasRecursiveOwnershipFlags = this.isRecursivelyPerpetuallySafelyFreeable(returnType.type);

		/**
		 * The returned object cannot live on its own. It needs the container to stick around.
		 * Should not be used for elided types, however, because that will make even the Swift
		 * object stick around forever. Instead, for elided types the object should merely be
		 * dangled.
		 */
		let anchorInfix = '';

		/**
		 * The returned object must never be freed.
		 * Usually the case iff the object has an anchor, because the anchor and the object refer
		 * to shared memory, so only one of the two may be freed.
		 */
		let dangleSuffix = '';

		/**
		 * This block is where we try to handle the anchoring, dangling, and danglingCloning.
		 * One should note that if the method whose return value is being considered for this
		 * is a clone method, none of this should be happening.
		 *
		 * The roundabout way of checking for that is if the return type matches the container
		 * type.
		 *
		 * Additionally, we obviously cannot set the anchor on a static method. In principle,
		 * we don't actually wanna set the anchor on any struct whose cType is the result
		 * of a function call, as opposed to a property that livings on cType itself.
		 *
		 * Detecting that might be really tricky, and could require additional context
		 * information.
		 */
		if (containerType && returnType.type !== containerType) {

			/**
			 * If a container type is elided, it might return an object whose content will
			 * stop working as soon as the elided type gets freed. To avoid that problem,
			 * we need to make sure that we a) anchor the elided type inside the return value,
			 * and b) make sure that the return value doesn't get freed, because its memory
			 * will be handled by the elided type instead.
			 *
			 * However, some elided types may have methods. While they're uncallable by
			 * external users of the SDK, they very well may be called from "batteries,"
			 * which necessitates the check to make sure that the return type is not,
			 * ironically, an actual return type. That works because this method can
			 * technically handle any contextual type.
			 */
			if (this.isElidedType(containerType!) && !(returnType instanceof RustFunctionReturnValue)) {
				if (!this.isElidedType(returnType.type)) {
					anchorInfix = ', anchor: self';
				}
				dangleSuffix = '.dangle()';
			}

			/**
			 * If the return type is actually a struct field, it means that this method is
			 * a field accessor, i.e. it's probably wrapping some field on the container's
			 * cType property in a Swift class.
			 *
			 * Should that returned value outlive the type whose value is being accessed, it
			 * might break that returned value, which is why the container type must be
			 * anchored inside the return.
			 *
			 * Additionally, given that the container and the return value both wrap the same
			 * memory, only one of the two may be freed, and we choose the container, which is
			 * why the returned value must be dangled.
			 */
			if (returnType instanceof RustStructField) {
				// it's a struct field accessor, meaning the memory must be anchored
				anchorInfix = ', anchor: self';
				/* if (!this.isElidedType(returnType.type)) {
					anchorInfix = ', anchor: self';
				}
				dangleSuffix = '.dangle()'; */
			}

			/**
			 * Some method calls produce return values that are still reliant on the caller's
			 * memory. One obvious example is structs with asTrait() methods, exemplified
			 * here. For those scenarios, the inner pointer is copied into the new object,
			 * and therefore the container must outlive the returned object.
			 *
			 * However, there is no issue with freeing both the returned object and the container,
			 * which is why we don't have a dangle() suffix.
			 */
			if (containerType instanceof RustStruct && returnType.type instanceof RustTrait) {
				anchorInfix = ', anchor: self';
			}

			// if (!this.isElidedType(containerType) && !this.isElidedType(returnType.type) && memoryContext && memoryContext.needsInstancePointer && !memoryContext.isFreeMethod && !memoryContext?.isCloneMethod) {
			if (!this.isElidedType(containerType) && memoryContext && memoryContext.needsInstancePointer && !memoryContext.isFreeMethod && !memoryContext.isCloneMethod) {
				// TODO: determine whether this is precise enough
				anchorInfix = ', anchor: self';

				/**
				 * In this peculiar condition where an instance pointer needs to be passed, we
				 * actually can still free the returned object – we simply need to make sure that
				 * the returned object doesn't outlive its creating object.
				 */
				if (hasRecursiveOwnershipFlags) {
					dangleSuffix = '.dangle(false)';
				}


				// if(returnType.type instanceof RustStruct && returnType.type.ownershipField){
				// 	// if it has an ownership field, it will already tell us if it's safe to free
				// 	// hence, NO OP here
				// } else {
				// 	// anchorInfix = ', anchor: self';
				// }
			}
		}

		if (hasRecursiveOwnershipFlags && (anchorInfix || dangleSuffix) && returnType instanceof RustFunctionReturnValue && memoryContext && memoryContext.needsInstancePointer) {
			// this doesn't seem to be doing much anyway
			// TODO: find instances in future releases where this might actually change something
			dangleSuffix = '.dangle(false)';
		}


		// TODO: add support for anchor infix and dangle()/danglingClone() suffixes
		if (returnType.type instanceof RustVector || returnType.type instanceof RustTuple || returnType.type instanceof RustPrimitiveWrapper || returnType.type instanceof RustNullableOption) {
			// basically all the elided types
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(cType: `;
			if (returnType.type instanceof RustPrimitiveWrapper && !dangleSuffix) {
				// these objects might be short-lived
				if (returnType.type.ownershipField) {
					// for now, we still dangle these
					// dangleSuffix = '.dangle()';
					dangleSuffix = '';
					// preparedReturnValue.wrapperSuffix += '.dynamicDangle()';
					// preparedReturnValue.wrapperSuffix += '.dangle()';
				} else if (returnType.type.isDeallocatable() || this.hasFreeMethod(returnType.type)) {
					// preparedReturnValue.wrapperSuffix += '.dangle()';
					dangleSuffix = '.dangle()';
				}
			}
			preparedReturnValue.wrapperSuffix += `${anchorInfix})${dangleSuffix}`;
			if (returnType.type !== containerType) {
				// it's an elided type, so we pass it through
				preparedReturnValue.wrapperSuffix += '.getValue()';
			}
		} else if (returnType.type instanceof RustTrait) {
			preparedReturnValue.wrapperPrefix += `NativelyImplemented${this.swiftTypeName(returnType.type)}(cType: `;
			preparedReturnValue.wrapperSuffix += `${anchorInfix})${dangleSuffix}`;
		} else if (returnType.type instanceof RustStruct || returnType.type instanceof RustResult || returnType.type instanceof RustTaggedValueEnum) {
			// basically all the non-elided types
			if (!this.isElidedType(returnType.type) && returnType.type instanceof RustStruct && containerType instanceof RustStruct && containerType.parentType instanceof RustTaggedValueEnum) {
				// one really odd edge case
				preparedReturnValue.wrapperPrefix += 'Bindings.';
			}
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(cType: `;
			preparedReturnValue.wrapperSuffix += `${anchorInfix})${dangleSuffix}`;
		} else if (returnType.type instanceof RustPrimitive) {
			// nothing to do here
			return preparedReturnValue;
		} else if (returnType.type instanceof RustPrimitiveEnum) {
			preparedReturnValue.wrapperPrefix += `${this.swiftTypeName(returnType.type)}(value: `;
			preparedReturnValue.wrapperSuffix += `)`;
		} else if (returnType.type instanceof RustArray) {
			if (returnType.type.iteratee instanceof RustPrimitive && Number.isFinite(returnType.type.length)) {
				// inlining a really long tuple would be rather ugly, so instead we're gonna
				// declare a type for it and generate some auxiliary conversion and typealiasing
				// artifacts
				const tupleTypeName = this.getRawTypeName(returnType.type);
				this.auxiliaryArtifacts.addTuple(returnType.type.iteratee.swiftRawSignature, returnType.type.length!);
				preparedReturnValue.wrapperPrefix += `Bindings.${tupleTypeName}ToArray(tuple: `;
				preparedReturnValue.wrapperSuffix += `)`;
			}
		} else {
			throw new Error(`Unsupported return type ${returnType.type.typeDescription}`);
		}
		return preparedReturnValue;
	}

	protected inheritedInits(type: RustType): string {
		const typeName = type.name;
		if (!typeName) {
			throw new Error('Unnamed type of kind ' + type.constructor.name);
		}

		let initialCFreeabilityInfix = '';
		if (type instanceof RustStruct && type.ownershipField) {
			initialCFreeabilityInfix = `self.initialCFreeability = self.cType!.${type.ownershipField.contextualName}`;
		}

		return `
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: ${typeName}?

					internal init(cType: ${typeName}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						${initialCFreeabilityInfix}
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: ${typeName}, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						${initialCFreeabilityInfix}
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		`;
	}

	protected renderDanglingCloneAndDeinitMethods(type: RustType): string {
		let danglingCloneCode = '';
		let freeCode = '';
		let ownershipSetterCode = '';

		const swiftTypeName = this.swiftTypeName(type);

		if (this.hasCloneMethod(type)) {
			danglingCloneCode = `
				internal func danglingClone() -> ${swiftTypeName} {
					let dangledClone = self.clone()
					dangledClone.dangling = true
					return dangledClone
				}
			`;
		}

		let freeabilityOverrideInfix = '';
		if (type instanceof RustStruct && type.ownershipField) {
			const ownershipName = type.ownershipField.contextualName;
			ownershipSetterCode = `
				internal func setCFreeability(freeable: Bool) -> ${swiftTypeName} {
					self.cType!.${ownershipName} = freeable
					return self
				}

				internal func dynamicDangle() -> ${swiftTypeName} {
					self.dangling = self.cType!.${ownershipName}
					return self
				}
			`;

			if (this.hasCloneMethod(type)) {
				danglingCloneCode += `
					internal func dynamicallyDangledClone() -> ${swiftTypeName} {
						let dangledClone = self.clone()
						// if it's owned, i. e. controlled by Rust, it should dangle on our end
						dangledClone.dangling = dangledClone.cType!.${ownershipName}
						return dangledClone
					}
				`;
			}

			if (type instanceof RustPrimitiveWrapper) {
				// if (type.name === 'LDKChannelMonitor') {
				// these types additionally store the original freeability value
				freeabilityOverrideInfix = `
						if !self.initialCFreeability {
							// only set to freeable if it was originally false
							// Bindings.print("Setting ${swiftTypeName} \\(self.instanceNumber)'s ${type.ownershipField?.contextualName}: \\(self.cType!.${ownershipName}) -> true")
							// self.cType!.${ownershipName} = true
						}
				`;
			}
		}

		if (this.hasFreeMethod(type)) {
			freeCode = `
				deinit {
					if Bindings.suspendFreedom {
						return
					}

					if !self.dangling {
						Bindings.print("Freeing ${swiftTypeName} \\(self.instanceNumber).")
						${freeabilityOverrideInfix}
						self.free()
					} else {
						Bindings.print("Not freeing ${swiftTypeName} \\(self.instanceNumber) due to dangle.")
					}
				}
			`;
		} else if (type instanceof RustPrimitiveWrapper) {
			if (type.dataField.type instanceof RustArray && Number.isFinite(type.dataField.type.length)) {
				// this is a tuple
			} else if (type.dataField.type instanceof RustPrimitive && !type.dataField.isAsteriskPointer) {
				// this is a singular value
			} else {
				freeCode = `
					deinit {
						if !self.dangling {
							print("Freeing ${swiftTypeName} \\(self.instanceNumber).")
							self.cType!.${type.dataField.contextualName}.deallocate()
						} else {
							print("Not freeing ${swiftTypeName} \\(self.instanceNumber) due to dangle.")
						}
					}
				`;
			}
		}


		return Generator.reindentCode(danglingCloneCode + ownershipSetterCode + freeCode, 5);

	}

	protected renderDocComment(comment: string, indentationDepth: number = 0): string {
		const indentation = '\t'.repeat(indentationDepth);
		const commentPrefix = '/// ';
		return commentPrefix + comment.replaceAll('\n', '\n' + indentation + commentPrefix);
	}

	private isPointerArgumentNullable(argument: RustFunctionArgument, containerType?: RustType): boolean {
		if (!argument.isAsteriskPointer) {
			return false;
		}

		if (argument.isNonnullablePointer) {
			return false;
		}

		if (containerType instanceof RustTrait) {
			return true;
		}

		// TODO: figure out how to properly detect this stuff!
		if (argument.type instanceof RustVector) {
			if (!(argument.type.iterateeField.type instanceof RustPrimitive)) {
				return true;
			}
		}

		return false;
	}

	private hasMethod(type: RustType, methodName: string) {
		let methods = type.methods;
		for (const currentMethod of methods) {
			const standaloneName = this.standaloneMethodName(currentMethod, type);
			if (standaloneName === methodName) {
				return true;
			}
		}

		if (type instanceof RustTrait) {
			for (const currentLambda of type.lambdas) {
				const standaloneName = this.standaloneLambdaName(currentLambda, type);
				if (standaloneName === methodName) {
					return true;
				}
			}
		}
		return false;
	}

	/**
	 * When receiving a value from a method that would normally call for anchoring the container
	 * inside the return value, there are yet sometimes exceptions, namely when despite passing
	 * a pointer, the returned values still own their memory. This is a method to determine whether
	 * a type truly owns its memory everywhere, or lets Rust know if it doesn't so there's no
	 * risk in being freed.
	 * @param type
	 * @private
	 */
	private isRecursivelyPerpetuallySafelyFreeable(type: RustType): boolean {
		if (type instanceof RustPrimitive) {
			return true;
		}
		if (type instanceof RustArray && Number.isFinite(type.length)) {
			return true;
		}
		if (type instanceof RustTuple) {
			for (const currentTupleValue of type.orderedFields) {
				if (!this.isRecursivelyPerpetuallySafelyFreeable(currentTupleValue.type)) {
					return false;
				}
			}
			return true;
		}
		if (type instanceof RustVector) {
			return this.isRecursivelyPerpetuallySafelyFreeable(type.deepestIterateeType);
		}
		/*
		if (type instanceof RustResult) {
			const valueType = type.valueField.type as RustResultValueEnum;
			const isResultSafe = this.isRecursivelyPerpetuallySafelyFreeable(valueType.resultVariant.type);
			const isErrorSafe = this.isRecursivelyPerpetuallySafelyFreeable(valueType.errorVariant.type);
			if (isResultSafe && isErrorSafe) {
				return true;
			}
		}
		if (type instanceof RustTaggedValueEnum) {
			for (const [_, currentVariant] of Object.entries(type.variants)) {
				const isCurrentVariantSafe = this.isRecursivelyPerpetuallySafelyFreeable(currentVariant.type);
				if (!isCurrentVariantSafe) {
					return false;
				}
			}
			return true;
		}
		*/
		if (type instanceof RustStruct) {
			if (type.ownershipField) {
				return true;
			}
			if (type instanceof RustPrimitiveWrapper) {
				if (!type.dataField.isAsteriskPointer) {
					return this.isRecursivelyPerpetuallySafelyFreeable(type.dataField.type);
				}
			}
		}
		if (type instanceof RustPrimitiveEnum || type instanceof RustPrimitiveEnumVariant) {
			return true;
		}
		return false;
	}

	private outputFilePath(type: RustType): string {
		let basePath = this.config.getOutputBaseDirectoryPath();
		const fileName = this.swiftTypeName(type) + '.swift';
		const outputPath = path.join(basePath, this.outputDirectorySuffix(), fileName);
		return outputPath;
	}

}

export interface PreparedArgument {
	/**
	 * This is the name of the variable that we end up passing to Rust
	 * In the simplest scenario, it's the public argument name
	 */
	name: string,

	/**
	 * This is the exact string that is passed at the native function's call site
	 * By default it's just the name of the variable, but can have complications like `.cType!`
	 */
	accessor: string,

	/**
	 * This is code that prepares the variable received from Swift to be passed to Rust
	 */
	conversion: string,

	methodCallWrapperPrefix: string;
	methodCallWrapperSuffix: string;

	/**
	 * This is code that is executed after the return value is constructed. Usually for either
	 * memory deallocation or, ironically, retention beyond the call site
	 */
	deferredCleanup: string
}

export interface PreparedReturnValue {
	wrapperPrefix: string;
	wrapperSuffix: string;
}

export interface MethodSemantics {
	/**
	 * True if the containing Swift method is accessing a struct's field.
	 */
	isValueAccessor: boolean;

	/**
	 * True if the containing Swift method is static.
	 */
	isStatic: boolean;

	/**
	 * True if the containing Swift method instantiates a new object of the same type.
	 */
	isConstructor: boolean;

	/**
	 * True if the containing Swift method returns a close of its containing struct.
	 */
	isCloneMethod: boolean;

	isFreeMethod: boolean;

	/**
	 * True if the method arguments include a pointer to the container type
	 */
	needsInstancePointer: boolean;
}

import {
	ContextualRustType,
	RustArray,
	RustFunctionArgument,
	RustFunctionReturnValue,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustVector
} from '../rust_types.mjs';
import {BaseTypeGenerator, PreparedArgument, PreparedReturnValue} from './base_type_generator.mjs';
import Generator from './index.mjs';

export default class TraitGenerator extends BaseTypeGenerator<RustTrait> {

	generateFileContents(type: RustTrait): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedLambdas = '';
		let generatedCallbacks = '';
		let generatedMethods = '';
		let fieldAccessors = '';

		let constructorArguments = [];
		let constructorPrep = '';

		let nativelyImplementedCallbacks = '';

		let traitInitializationArguments = [];

		let hasFreeLambda = false;

		for (const currentField of type.orderedFields) {
			if (currentField instanceof RustLambda) {
				// todo: canonicalize argument lambda name determination
				if (currentField.thisArgument) {
					generatedLambdas += Generator.reindentCode(this.generateLambda(currentField, type), 6);

					const currentLambdaSwiftName = Generator.snakeCaseToCamelCase(currentField.name) + 'Lambda';
					traitInitializationArguments.push(`${currentField.name}: ${currentLambdaSwiftName}`);

					if (currentField.name === 'free') {
						hasFreeLambda = true;
					}

					generatedCallbacks += this.generateCallbackStub(currentField, type);
					nativelyImplementedCallbacks += this.generateNativelyImplementedCallback(currentField, type);
				} else {
					// don't push weird lambdas
					traitInitializationArguments.push(`${currentField.name}: nil`);
				}
			} else {
				// currentField is definitely instanceof ContextualRustType
				const swiftArgumentName = Generator.snakeCaseToCamelCase(currentField.contextualName);
				let initializationValue = swiftArgumentName;

				// this might be an additional parameter that's necessary for initialization
				if (currentField.contextualName !== 'this_arg') {
					const swiftArgumentType = this.getPublicTypeSignature(currentField.type, type);
					constructorArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);

					const preparedArgument = this.prepareSwiftArgumentForRust(currentField, type);
					constructorPrep += preparedArgument.conversion;

					initializationValue = `${preparedArgument.methodCallWrapperPrefix}${preparedArgument.accessor}${preparedArgument.methodCallWrapperSuffix}`;

					fieldAccessors += this.generateAccessor(currentField, type);
				}

				traitInitializationArguments.push(`${currentField.contextualName}: ${initializationValue}`);
			}
		}

		let renderedTraitInitializationArguments = '';
		if (traitInitializationArguments.length > 0) {
			renderedTraitInitializationArguments = '\n' + traitInitializationArguments.join(',\n') + '\n';
			renderedTraitInitializationArguments = Generator.reindentCode(renderedTraitInitializationArguments, 7);

			// cut off the trailing tab character
			renderedTraitInitializationArguments = renderedTraitInitializationArguments.substring(0, renderedTraitInitializationArguments.length - 1);
		}

		for (const currentMethod of type.methods) {
			const currentMethodName = this.swiftMethodName(currentMethod, type);
			if (hasFreeLambda && currentMethodName === 'free') {
				// the native detour value checker is more circuitous
				continue;
			}

			generatedMethods += this.generateMethod(currentMethod, type);
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.documentation, 4)}
				open class ${swiftTypeName}: NativeTraitWrapper {

					${this.inheritedInits(type)}

					public init(${constructorArguments.join(', ')}) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						${constructorPrep}

						${generatedLambdas}

						self.cType = ${type.name}(${renderedTraitInitializationArguments})
					}

					${generatedCallbacks}

					${generatedMethods}

					${fieldAccessors}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ${swiftTypeName} \\(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ${swiftTypeName} \\(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplemented${swiftTypeName}: ${swiftTypeName} {
					${nativelyImplementedCallbacks}
				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'traits';
	}

	/**
	 * This is the Swift type that the Swift compiler natively maps C types into
	 * For instance, C's uint64_t[3] would become a Swift tuple: (UInt64, UInt64, UInt64)
	 *
	 * The difference between this method and getRawTypeName is that this one is context-aware,
	 * and can handle the raw type wrapped in pointers and optionals.
	 * @param contextualType
	 * @protected
	 */
	protected getRawTypeSignature(contextualType: ContextualRustType): string {

		const type = contextualType.type;
		const rawTypeName = this.getRawTypeName(type);

		// if everything is simple, return the type name directly
		if (!contextualType.isAsteriskPointer && !contextualType.isConstant && !contextualType.isNonnullablePointer) {
			return rawTypeName;
		}

		if (contextualType.isAsteriskPointer) {

			const nullabilitySuffix = contextualType.isNonnullablePointer ? '' : '?';
			const mutabilityInfix = contextualType.isConstant ? '' : 'Mutable';

			if (type instanceof RustPrimitive && type.swiftRawSignature === 'Void') {
				// usually the case when `contextualType.contextualName === 'this_arg'`
				return `Unsafe${mutabilityInfix}RawPointer${nullabilitySuffix}`;
			}

			return `Unsafe${mutabilityInfix}Pointer<${rawTypeName}>${nullabilitySuffix}`;

		}

		throw new Error(`Unmapped raw type: ${type.typeDescription}`);
	}

	protected generateCallbackStub(lambda: RustLambda, type: RustTrait): string {
		const swiftTypeName = this.swiftTypeName(type);
		const swiftMethodName = Generator.snakeCaseToCamelCase(lambda.name);
		let swiftMethodArguments = [];

		const isFreeCallback = (swiftMethodName === 'free');
		const visibility = isFreeCallback ? 'internal' : 'open';

		for (const currentArgument of lambda.arguments) {
			if (currentArgument === lambda.thisArgument) {
				continue;
			}

			let swiftArgumentName = Generator.snakeCaseToCamelCase(currentArgument.contextualName);
			if (swiftArgumentName === 'init') {
				swiftArgumentName = 'initArgument';
			}

			let swiftArgumentType = this.getPublicTypeSignature(currentArgument.type, type, currentArgument);

			swiftMethodArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);
		}

		const swiftReturnType = this.getPublicTypeSignature(lambda.returnValue.type);

		let isFreeBody = '';
		if (isFreeCallback) {
			isFreeBody = `
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			`;
		}

		return `
					${this.renderDocComment(lambda.documentation, 5)}
					${visibility} func ${swiftMethodName}(${swiftMethodArguments.join(', ')}) -> ${swiftReturnType} {
						${isFreeBody}
						Bindings.print("Error: ${swiftTypeName}::${swiftMethodName} MUST be overridden! Offending class: \\(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		`;
	}

	// TODO: this looks almost identical to generateMethod(). Figure out a way to DRY
	protected generateNativelyImplementedCallback(lambda: RustLambda, type: RustTrait): string {
		const swiftMethodName = Generator.snakeCaseToCamelCase(lambda.name);
		let swiftMethodArguments = [];
		let nativeCallValueAccessors = [];

		let nativeCallPrefix = '';
		let nativeCallWrapperPrefix = '', nativeCallWrapperSuffix = '';
		let nativeCallSuffix = '';

		for (const currentArgument of lambda.arguments) {
			if (currentArgument === lambda.thisArgument) {
				nativeCallValueAccessors.push('self.cType!.this_arg');
				continue;
			}

			let swiftArgumentName = Generator.snakeCaseToCamelCase(currentArgument.contextualName);
			let context = currentArgument;
			if (swiftArgumentName === 'init') {
				swiftArgumentName = 'initArgument';
				context = new RustFunctionArgument();
				Object.assign(context, currentArgument);
				context.contextualName = 'init_argument';
			}

			const swiftArgumentType = this.getPublicTypeSignature(currentArgument.type, type, context);
			swiftMethodArguments.push(`${swiftArgumentName}: ${swiftArgumentType}`);

			const preparedArgument = this.prepareSwiftArgumentForRust(context, type);

			nativeCallPrefix += preparedArgument.conversion;
			nativeCallWrapperPrefix += preparedArgument.methodCallWrapperPrefix;
			nativeCallWrapperSuffix += preparedArgument.methodCallWrapperSuffix;
			nativeCallValueAccessors.push(preparedArgument.accessor);
			nativeCallSuffix += preparedArgument.deferredCleanup;
		}

		const swiftReturnType = this.getPublicTypeSignature(lambda.returnValue.type, type);
		const returnTypeInfix = (swiftReturnType === 'Void' || swiftMethodName === 'init') ? '' : `-> ${swiftReturnType} `;

		const preparedReturnValue = this.prepareRustReturnValueForSwift(lambda.returnValue, type);

		let freeBody = '';
		if (swiftMethodName === 'free') {
			// TODO: figure out how to handle potentially nullable natively implemented traits
			freeBody = `
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			`;
		}

		return `
					${this.renderDocComment(lambda.documentation, 5)}
					public override func ${swiftMethodName}(${swiftMethodArguments.join(', ')}) ${returnTypeInfix}{
						// native call variable prep
						${nativeCallPrefix}

						${freeBody}

						// native method call
						let nativeCallResult = ${nativeCallWrapperPrefix}self.cType!.${lambda.name}(${nativeCallValueAccessors.join(', ')})${nativeCallWrapperSuffix}

						// cleanup
						${nativeCallSuffix}

						// return value (do some wrapping)
						let returnValue = ${preparedReturnValue.wrapperPrefix}nativeCallResult${preparedReturnValue.wrapperSuffix}

						return returnValue
					}
		`;
	}

	/**
	 * This is really just a way of preparing a value passed by Rust into a lambda such that
	 * it can be fed into the Swift callback function that users may or may not override.
	 *
	 * The only reason it's slightly more complicated than `prepareRustReturnValueForSwift` is that
	 * there may be argument prep beforehand, so the name of the variable might change.
	 *
	 * Additionally, with multiple arguments given to a function, there names need to be tracked.
	 * With a return value, on the other hand, there is no ambiguity, and neither name nor
	 * accessor need specifying.
	 *
	 * Note that inside lambdas, `anchor: self` CANNOT and MUST NOT be used, because referencing
	 * `self` would make that lambda inconvertible to a context-free C function
	 * @param argumentType
	 * @protected
	 */
	private prepareRustArgumentForSwift(argumentType: RustFunctionArgument): PreparedSwiftArgument {

		let labelName = Generator.snakeCaseToCamelCase(argumentType.contextualName);
		if (labelName === 'init') {
			labelName = 'initArgument';
		}

		const preparedArgument: PreparedSwiftArgument = {
			name: argumentType.contextualName,
			accessor: argumentType.contextualName,
			label: labelName,

			conversion: '',

			methodCallWrapperPrefix: '',
			methodCallWrapperSuffix: '',

			deferredCleanup: ''
		};

		if (argumentType.contextualName === 'init') {
			preparedArgument.name = 'initArgument';
			preparedArgument.accessor = 'initArgument';
		}

		// TODO: add support for anchor infix and dangle()/danglingClone() suffixes

		const type = argumentType.type;

		let needsUnwrapping = argumentType.isAsteriskPointer && !argumentType.isNonnullablePointer;

		let memoryManagementInfix = '';
		if (!(type instanceof RustTrait) && this.hasFreeMethod(type) && argumentType.isAsteriskPointer) {
			// we wanna dangle this value no matter what, because we don't know the longevity
			memoryManagementInfix = '.dangle()';
			if (this.hasCloneMethod(type)) {
				if (this.hasOwnershipField(type)) {
					// we're always gonna clone it for now because we know this isn't being passed
					// back into Rust
					memoryManagementInfix += '.clone()';
					// memoryManagementInfix += '.dynamicallyDangledClone()';
				} else {
					// we have to assume that Rust will just eat this type
					memoryManagementInfix += '.clone()';
				}
			}
		} else if (type instanceof RustPrimitiveWrapper && type.isDeallocatable() && !type.ownershipField) {
			// if the type is deallocatable but without an ownership field, we must dangle it
			// the assumption being that we receive it with is_owned set to false
			memoryManagementInfix = '.dangle()';
		}

		if (argumentType.isAsteriskPointer && argumentType.isNonnullablePointer) {
			// we can simply refer to the pointee without unwrapping it
			preparedArgument.accessor += '.pointee';
		}

		if (type instanceof RustVector || type instanceof RustPrimitiveWrapper || type instanceof RustNullableOption) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(cType: `;
			preparedArgument.methodCallWrapperSuffix += `)${memoryManagementInfix}.getValue()`;
		} else if (type instanceof RustTrait) {
			preparedArgument.methodCallWrapperPrefix += `NativelyImplemented${this.swiftTypeName(type)}(cType: `;
			preparedArgument.methodCallWrapperSuffix += `)`;
		} else if (type instanceof RustStruct || type instanceof RustResult || type instanceof RustTaggedValueEnum) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(cType: `;
			preparedArgument.methodCallWrapperSuffix += `)${memoryManagementInfix}`;
		} else if (type instanceof RustPrimitive) {
			// nothing to do here
		} else if (type instanceof RustArray) {
			// CAUTION: REQUIRES SPECIAL HANDLING IF UNWRAPPING IS NECESSARY
			const iteratee = type.iteratee;
			if (iteratee instanceof RustPrimitive && Number.isFinite(type.length)) {
				// inlining a really long tuple would be rather ugly, so instead we're gonna
				// declare a type for it and generate some auxiliary conversion and typealiasing
				// artifacts
				const tupleTypeName = this.getRawTypeName(type);
				preparedArgument.methodCallWrapperPrefix = `Bindings.${tupleTypeName}ToArray(tuple: `;
				preparedArgument.methodCallWrapperSuffix = `)`;
			}
		} else if (type instanceof RustPrimitiveEnum) {
			preparedArgument.methodCallWrapperPrefix += `${this.swiftTypeName(type)}(value: `;
			preparedArgument.methodCallWrapperSuffix += `)`;
		} else {
			throw new Error(`Unsupported return type ${type.typeDescription}`);
		}

		// we're dealing with a nullable UnsafePointer here
		// because this thing is nullable, we must unwrap it
		if (needsUnwrapping) {
			/**
			 * If a pointer is non-nullable, the any conversion and elision handling must happen
			 * inside the unwrapping context
			 */
			if (preparedArgument.conversion) {
				throw new Error('Prepared nullable pointer type has conversion block constructed prior to the unwrapper construction.');
			}

			preparedArgument.conversion += `
				var ${preparedArgument.name}Pointee: ${this.getPublicTypeSignature(type)}? = nil
				if let ${preparedArgument.name}Unwrapped = ${preparedArgument.accessor} {
					${preparedArgument.name}Pointee = ${preparedArgument.methodCallWrapperPrefix}${preparedArgument.name}Unwrapped.pointee${preparedArgument.methodCallWrapperSuffix}
				}
			`;

			preparedArgument.methodCallWrapperPrefix = '';
			preparedArgument.methodCallWrapperSuffix = '';
			preparedArgument.name += 'Pointee';
			preparedArgument.accessor = preparedArgument.name;
		}

		return preparedArgument;
	}

	private prepareSwiftReturnValueForRust(returnType: RustFunctionReturnValue): PreparedReturnValue {
		const preparedReturnValue: PreparedReturnValue = {
			wrapperPrefix: '',
			wrapperSuffix: ''
		};

		// these type elision helpers only apply outside the context of the very eliding type
		let type = returnType.type;
		if (type instanceof RustVector) {
			preparedReturnValue.wrapperPrefix = `${this.swiftTypeName(type)}(array: `;
			preparedReturnValue.wrapperSuffix = `).dangle().cType!`;
		} else if (type instanceof RustPrimitiveWrapper) {
			preparedReturnValue.wrapperPrefix = `${this.swiftTypeName(type)}(value: `;
			preparedReturnValue.wrapperSuffix = `).dangle().cType!`;
		} else if (type instanceof RustNullableOption) {
			preparedReturnValue.wrapperPrefix = `${this.swiftTypeName(type)}(some: `;
			preparedReturnValue.wrapperSuffix = `).dangle().cType!`;
		} else if (type instanceof RustTaggedValueEnum || type instanceof RustResult) {
			preparedReturnValue.wrapperSuffix = '.cType!';
		} else if (type instanceof RustTrait) {
			preparedReturnValue.wrapperSuffix = '.activate().cType!';
		} else if (type instanceof RustStruct) {
			preparedReturnValue.wrapperSuffix = '.cType!';
		} else if (type instanceof RustPrimitive) {
			// nothing to do here
		} else if (type instanceof RustPrimitiveEnum) {
			preparedReturnValue.wrapperSuffix = '.getCValue()';
		} else {
			throw new Error(`Unsupported native return type: ${returnType.type.typeDescription}`);
		}

		if (returnType.isAsteriskPointer) {
			throw new Error(`Unsupported native pointer return type: ${returnType.type.typeDescription}`);
		}

		return preparedReturnValue;
	}

	/**
	 * This is the lambda that is passed to Rust when constructing a new trait.
	 * The lambda will be called by Rust with raw Rust arguments, and Rust will be expecting it
	 * to return raw Rust return values.
	 *
	 * Internally, the lambda will convert the Rust arguments to Swift types, call the instance's
	 * Swift callback method, and then convert the Swift result back to Rust for the Rust caller's
	 * consumption.
	 * @param lambda
	 * @param type
	 * @private
	 */
	private generateLambda(lambda: RustLambda, type: RustTrait) {

		const swiftTypeName = this.swiftTypeName(type);
		const swiftLambdaName = Generator.snakeCaseToCamelCase(lambda.name) + 'Lambda';

		// should be equivalent to this.swiftMethodName() if lambda was a `RustFunction`
		const swiftCallbackName = Generator.snakeCaseToCamelCase(lambda.name);

		let rawLambdaArguments = [];
		let swiftCallbackArguments = [];
		let swiftCallPrefix = '';
		let swiftCallSuffix = '';

		for (const currentArgument of lambda.arguments) {
			const rawTypeName = this.getRawTypeSignature(currentArgument);
			if (currentArgument.contextualName === 'init') {
				rawLambdaArguments.push(`initArgument: ${rawTypeName}`);
			} else {
				rawLambdaArguments.push(`${currentArgument.contextualName}: ${rawTypeName}`);
			}

			if (currentArgument === lambda.thisArgument) {
				continue;
			}
			const preparedArgument = this.prepareRustArgumentForSwift(currentArgument);
			swiftCallPrefix += preparedArgument.conversion;
			swiftCallSuffix += preparedArgument.deferredCleanup;
			swiftCallbackArguments.push(`${preparedArgument.label}: ${preparedArgument.methodCallWrapperPrefix}${preparedArgument.accessor}${preparedArgument.methodCallWrapperSuffix}`);
		}

		const rawReturnType = this.getRawTypeSignature(lambda.returnValue);
		const preparedReturnValue = this.prepareSwiftReturnValueForRust(lambda.returnValue);

		return `
			func ${swiftLambdaName}(${rawLambdaArguments.join(', ')}) -> ${rawReturnType} {
				let instance: ${swiftTypeName} = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "${swiftTypeName}::${swiftLambdaName}")

				// Swift callback variable prep
				${Generator.reindentCode(swiftCallPrefix, 4)}

				// Swift callback call
				let swiftCallbackResult = instance.${swiftCallbackName}(${swiftCallbackArguments.join(', ')})

				// cleanup
				${swiftCallSuffix}

				// return value (do some wrapping)
				let returnValue = ${preparedReturnValue.wrapperPrefix}swiftCallbackResult${preparedReturnValue.wrapperSuffix}

				return returnValue
			}
		`;
	}

}

interface PreparedSwiftArgument extends PreparedArgument {
	/**
	 * The parameter label for the argument used to call the Swift method
	 */
	label: string;
}

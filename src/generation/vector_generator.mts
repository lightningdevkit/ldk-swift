import {
	RustFunctionArgument,
	RustPrimitive,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum,
	RustTuple,
	RustType,
	RustVector
} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class VectorGenerator extends BaseTypeGenerator<RustVector> {

	generateFileContents(type: RustVector): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';
		for (const currentMethod of type.methods) {
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		// this type is elided
		const swiftPublicType = this.getPublicTypeSignature(type);

		let dataContainerInitializationArgumentName = 'rustArray';
		let dimensionalityReduction = '';

		/**
		 * Necessary for init() methods that take a Swift array
		 */
		let swiftArrayToRustArrayMapper = '';

		/**
		 * Necessary for getValue() calls that need to produce a Swift array
		 */
		let rustArrayToSwiftArrayMapper = '';

		/**
		 * If the deepest type is not a primitive, a Rust->Swift mapper is definitely necessary,
		 * and a Swift->Rust mapper is potentially necessary
		 */
		if (!(type.deepestIterateeType instanceof RustPrimitive)) {
			// we'll need to map the Rust types to Swift types because they're not primitive
			const leftSquareBrackets = '['.repeat(type.depth - 1);
			const rightSquareBrackets = ']'.repeat(type.depth - 1);
			const deepestIterateeName = type.deepestIterateeType.name;
			rustArrayToSwiftArrayMapper = `let swiftArray = array.map { (currentCType: ${leftSquareBrackets}${deepestIterateeName}${rightSquareBrackets}) -> ${this.getPublicTypeSignature(type.iterateeField.type)} in\n`;

			let unwrapperSuffix = '';

			const artificialDeepestContext = new RustFunctionArgument();
			artificialDeepestContext.contextualName = 'currentValueDepth1';
			artificialDeepestContext.type = type.deepestIterateeType;

			if (type.iterateeField.type instanceof RustVector) {
				let currentDepth = 1;
				let currentIteratee: RustType = type.iterateeField.type;
				while (currentIteratee instanceof RustVector) {
					const indentationDepth = 6 + currentDepth;
					const indentation = `\t`.repeat(indentationDepth);

					let leftSquareBrackets = '['.repeat(type.depth - currentDepth - 1);
					let rightSquareBrackets = ']'.repeat(type.depth - currentDepth - 1);
					rustArrayToSwiftArrayMapper += `${indentation}currentCType.map { (currentCType: ${leftSquareBrackets}${deepestIterateeName}${rightSquareBrackets}) -> ${this.getPublicTypeSignature(currentIteratee.iterateeField.type)} in\n`;
					unwrapperSuffix += `\n${indentation}}`;

					currentIteratee = currentIteratee.iterateeField.type;
					currentDepth++;
				}
			} else {
				// additionally, if the top level iteratee is not a rust vector, a Swift->Rust mapper is necessary
				// (if it is a vector, a corresponding underlying vector can be trivially initiated)
				// const leftSquareBrackets = '['.repeat(type.depth);
				// const rightSquareBrackets = ']'.repeat(type.depth);

				const deepestRustValueUnwrapper = this.prepareSwiftArgumentForRust(artificialDeepestContext, type);
				swiftArrayToRustArrayMapper = `
						let rustArray = array.map { (currentValueDepth1: ${this.getPublicTypeSignature(type.deepestIterateeType)}) -> ${leftSquareBrackets}${deepestIterateeName}${rightSquareBrackets} in
							${deepestRustValueUnwrapper.conversion}
							return ${deepestRustValueUnwrapper.methodCallWrapperPrefix}${deepestRustValueUnwrapper.accessor}${deepestRustValueUnwrapper.methodCallWrapperSuffix}
						}
				`;
			}

			unwrapperSuffix += '\n' + '\t'.repeat(6) + '}';

			/**
			 * This constructs the individual Swift objects that comprise the array we return.
			 * Because these objects are reliant on the array's underlying cType not getting
			 * freed, we need to register the array as an achor inside of them.
			 *
			 * Additionally, because now the potential for double-free arises due to the combination
			 * of both the individual objects and the vector getting dereferenced, this individual
			 * objects must be .dangled().
			 */
			artificialDeepestContext.contextualName = 'currentValueDepth' + type.depth;
			const deepestSwiftReturnValueWrapper = this.prepareRustReturnValueForSwift(artificialDeepestContext, type);
			let deepestConstructor = `${deepestSwiftReturnValueWrapper.wrapperPrefix}currentCType${deepestSwiftReturnValueWrapper.wrapperSuffix}`;
			rustArrayToSwiftArrayMapper += `${deepestConstructor}${unwrapperSuffix}`;
		} else {
			rustArrayToSwiftArrayMapper = 'let swiftArray = array';
		}

		let bracketedIterateeTypeName = null;
		if (type.iterateeField.type instanceof RustVector) {
			const iterateeRustTypeName = type.iterateeField.type.name;
			bracketedIterateeTypeName = '<' + iterateeRustTypeName + '>';

			// avoid elision
			const iterateeSwiftTypeName = this.getPublicTypeSignature(type.iterateeField.type, type.iterateeField.type);

			const artificialIntermediateContext = new RustFunctionArgument();
			artificialIntermediateContext.contextualName = 'currentEntry';
			artificialIntermediateContext.type = type.iterateeField.type;
			const intermediateLayerRustValueUnwrapper = this.prepareSwiftArgumentForRust(artificialIntermediateContext, type);

			dimensionalityReduction = `
						var lowerDimension = [${iterateeRustTypeName}]()
						for currentEntry in array {
							${intermediateLayerRustValueUnwrapper.conversion}
							lowerDimension.append(${intermediateLayerRustValueUnwrapper.accessor})
							try! self.addAnchor(anchor: ${intermediateLayerRustValueUnwrapper.name})
						}
			`;
			dataContainerInitializationArgumentName = 'lowerDimension';

		} else if (type.iterateeField.type instanceof RustPrimitive) {
			bracketedIterateeTypeName = `<${type.iterateeField.type.swiftRawSignature}>`;
			dataContainerInitializationArgumentName = 'array';
		} else if (type.iterateeField.type instanceof RustTuple || type.iterateeField.type instanceof RustPrimitiveWrapper || type.iterateeField.type instanceof RustTaggedValueEnum || type.iterateeField.type instanceof RustResult || type.iterateeField.type instanceof RustStruct) {
			bracketedIterateeTypeName = `<${type.iterateeField.type.name}>`;
		} else {
			throw new Error(`Unsupported vector iteratee type in ${type.name}: ${type.iterateeField.type.typeDescription}`);
		}

		if (!bracketedIterateeTypeName) {
			throw new Error(`Undetected vector iteratee type name in ${type.name}: ${type.iterateeField.type.typeDescription}`);
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			${this.renderDocComment(type.documentation, 3)}
			internal typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.documentation, 4)}
				internal class ${swiftTypeName}: NativeTypeWrapper {

					${this.inheritedInits(type)}

					internal init(array: ${swiftPublicType}, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)

						${swiftArrayToRustArrayMapper}

						${dimensionalityReduction}

						let dataContainer = UnsafeMutablePointer${bracketedIterateeTypeName}.allocate(capacity: array.count)
						dataContainer.initialize(from: ${dataContainerInitializationArgumentName}, count: array.count)

        				let vector = ${type.name}(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> ${swiftPublicType} {

						var array = ${this.getRustArrayTypeSignature(type)}()

						${this.valueAccessCode(type)}

						${rustArrayToSwiftArrayMapper}
						return swiftArray
					}

					${generatedMethods}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
        				self.dangling = shouldDangle
						return self
					}

					internal func dangleRecursively() -> ${swiftTypeName} {
						self.dangling = true
						for currentAnchor in self.anchors {
							currentAnchor.dangleRecursively()
						}
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'vectors';
	}

	private valueAccessCode(type: RustVector, depth = 1) {

		const additionalIndentation = '\t'.repeat(depth - 1);

		let higherLevelArrayName = `convertedEntry${depth - 1}`;
		let higherLevelAccessor = `currentEntry${depth - 1}`;
		if (depth === 1) {
			higherLevelArrayName = 'array';
			higherLevelAccessor = 'self.cType!';
		}

		let termination = `${additionalIndentation}${higherLevelArrayName}.append(currentEntry${depth})`;

		if (type.iterateeField.type instanceof RustVector) {
			// it's nested
			termination = `
							${additionalIndentation}var convertedEntry${depth} = ${this.getRustArrayTypeSignature(type.iterateeField.type)}()

							${this.valueAccessCode(type.iterateeField.type, depth + 1)}

							${additionalIndentation}${higherLevelArrayName}.append(convertedEntry${depth})
			`;
		}

		return `
						${additionalIndentation}for index${depth} in 0..<Int(${higherLevelAccessor}.datalen) {
							${additionalIndentation}let currentEntry${depth} = ${higherLevelAccessor}.data[index${depth}]
							${termination}
						${additionalIndentation}}
		`;
	}

	private getRustArrayTypeSignature(type: RustType): string {
		if (type instanceof RustVector) {
			return `[${this.getRustArrayTypeSignature(type.iterateeField.type)}]`;
		} else if (type instanceof RustPrimitive) {
			return type.swiftRawSignature;
		}
		const typeName = type.name;
		if (!typeName) {
			throw new Error('Unnamed type of kind ' + type.constructor.name);
		}
		return typeName;
	}

}

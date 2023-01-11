import {
	RustFunction,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant,
	RustStruct,
	RustTaggedValueEnum
} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';
import Generator from './index.mjs';
import StructGenerator from './struct_generator.mjs';

export default class ComplexEnumGenerator extends BaseTypeGenerator<RustTaggedValueEnum> {

	generateFileContents(type: RustTaggedValueEnum): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';


		const conflictingArgumentConstructors = this.collectConflictingConstructors(type);

		for (const currentMethod of type.methods) {
			const isConflictingConstructor = conflictingArgumentConstructors.has(currentMethod);
			generatedMethods += this.generateMethod(currentMethod, type, isConflictingConstructor);
		}

		let childStructs: RustStruct[] = [];

		// the variant tag is definitely set
		const tagType = type.variantTag!.type as RustPrimitiveEnum;

		let tagEnumVariants = '';
		let valueTypeDetector = 'switch self.cType!.tag {';
		for (const [index, currentVariant] of tagType.variants.entries()) {
			const currentVariantSwiftName = currentVariant.name.replace(type.name + '_', '');
			tagEnumVariants += `
						${this.renderDocComment(currentVariant.documentation, 6)}
						case ${currentVariantSwiftName}
			`;

			valueTypeDetector += `
							case ${currentVariant.name}:
								return .${currentVariantSwiftName}
			`;
		}

		valueTypeDetector += `
							default:
								Bindings.print("Error: Invalid value type for ${swiftTypeName}! Aborting.", severity: .ERROR)
								abort()
						}
		`;

		let polymorphicAccessors = '';
		for (const [_, currentVariant] of Object.entries(type.variants)) {
			const currentPublicType = this.getPublicTypeSignature(currentVariant.type, type);
			const camelCasedVariantName = Generator.snakeCaseToCamelCase(currentVariant.contextualName, true);

			/**
			 * This is a special-cased workaround for the following two offenders:
			 * – `LDKEvent_LDKPendingHTLCsForwardable_Body pending_htl_cs_forwardable;`
			 * – `LDKMessageSendEvent_LDKUpdateHTLCs_Body`
			 *
			 * For now, we just do a string substitution, but long term…
			 * TODO: keep bugging Matt until this is gone from the header file
			 */
			let currentSwiftTypeName = camelCasedVariantName.replace('HtlC', 'Htlc');

			if (currentVariant.type.parentType === type) {
				if (!(currentVariant.type instanceof RustStruct)) {
					throw new Error(`Complex enum with odd child type: ${currentVariant.type.typeDescription}`);
				}
				childStructs.push(currentVariant.type as RustStruct);
			}

			const preparedReturnValue = this.prepareRustReturnValueForSwift(currentVariant, type);

			let matchingTagTypeVariant: RustPrimitiveEnumVariant | null = null;
			for (const currentTagVariant of tagType.variants) {
				if (currentTagVariant.name.toLowerCase()
				.endsWith(currentVariant.contextualName.replaceAll('_', '').toLowerCase())) {
					matchingTagTypeVariant = currentTagVariant;
					break;
				}
			}

			if (!matchingTagTypeVariant) {
				throw new Error(`Unable to find matching tag variant in ${currentVariant.type.typeDescription} for ${currentVariant.contextualName}`);
			}

			polymorphicAccessors += `
					public func getValueAs${currentSwiftTypeName}() -> ${currentPublicType}? {
						if self.cType?.tag != ${matchingTagTypeVariant.name} {
							return nil
						}

						return ${preparedReturnValue.wrapperPrefix}self.cType!.${currentVariant.contextualName}${preparedReturnValue.wrapperSuffix}
					}
			`;
		}

		let renderedChildStructs = '';

		if (childStructs.length > 0) {
			const childStructGenerator = new StructGenerator(this.config, this.auxiliaryArtifacts);
			for (const currentChildStruct of childStructs) {
				let currentStructRendering = childStructGenerator.generateFileContents(currentChildStruct, type);
				// embedded structs have no business being publicly initializeable
				currentStructRendering = currentStructRendering.replaceAll('public init(', 'fileprivate init(');
				renderedChildStructs += Generator.reindentCode(currentStructRendering, 5);
			}
		}

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.variantTag!.type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {

					${this.inheritedInits(type)}

					public enum ${swiftTypeName}Type {
						${tagEnumVariants}
					}

					public func getValueType() -> ${swiftTypeName}Type {
						${valueTypeDetector}
					}

					${generatedMethods}

					${polymorphicAccessors}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
        				self.dangling = shouldDangle
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

					${renderedChildStructs}

				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'enums/complex';
	}
}

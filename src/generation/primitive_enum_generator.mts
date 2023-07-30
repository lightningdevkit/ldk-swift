import {RustPrimitiveEnum} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class PrimitiveEnumGenerator extends BaseTypeGenerator<RustPrimitiveEnum> {

	generateFileContents(type: RustPrimitiveEnum): string {
		if (type.parentType) {
			throw new Error(`Only orphan primitive enums may be generated. ${type.name} belongs to ${type.parentType.typeDescription}`);
		}

		const swiftTypeName = this.swiftTypeName(type);

		let enumVariants = '';
		let rustValueAccessor = '';
		let swiftValueInitializer = '';

		// no reason in particular we're picking the last one and not any other
		// picking the first one would merely require an additional check inside the loop
		let lastSwiftVariantName = '';

		for (const [index, currentVariant] of type.variants.entries()) {
			const currentVariantSwiftName = currentVariant.name.replace(type.name + '_', '');
			const isLast = (index == type.variants.length - 1);

			enumVariants += `
					${this.renderDocComment(currentVariant.documentation, 5)}
					case ${currentVariantSwiftName}
			`;

			rustValueAccessor += `
							case .${currentVariantSwiftName}:
								return ${currentVariant.name}
			`;

			swiftValueInitializer += `
							case ${currentVariant.name}:
								self = .${currentVariantSwiftName}
			`;

			lastSwiftVariantName = currentVariantSwiftName;
		}

		swiftValueInitializer += `
			default:
				Bindings.print("Error: Invalid value type for ${swiftTypeName}! Aborting.", severity: .ERROR)
				abort()
		`;

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.documentation, 4)}
				public enum ${swiftTypeName} {

					${enumVariants}

					internal init (value: ${type.name}) {
						switch value {
							${swiftValueInitializer}
						}
					}

					internal func getCValue() -> ${type.name} {
						switch self {
							${rustValueAccessor}
						}
					}

				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'enums/primitive';
	}

}

import {RustFunction, RustStruct, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class StructGenerator extends BaseTypeGenerator<RustStruct> {

	generateFileContents(type: RustStruct, containerType?: RustType): string {
		let swiftTypeName = this.swiftTypeName(type);

		let containerLessPrefix = `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {
		`;
		let containerLessSuffix = `
			}
		`;

		if (type.parentType && type.parentType !== containerType) {
			throw new Error(`Only orphan structs may be generated. ${type.name} belongs to ${type.parentType.typeDescription}`);
		} else if (type.parentType) {
			swiftTypeName = this.getPublicTypeSignature(type, containerType);
			containerLessPrefix = `
				${this.renderDocComment(type.documentation, 4)}
				internal typealias ${this.getPublicTypeSignature(type)} = ${swiftTypeName}
			`;
			containerLessSuffix = '';
		}

		let fieldAccessors = '';
		let generatedMethods = '';

		let ownershipInfix = '';
		let initialCFreeabilityInfix = '';
		if (type.ownershipField) {
			// TODO: determine if setting this value to true by default is wise
			ownershipInfix = `, ${type.ownershipField.contextualName}: true`;
			initialCFreeabilityInfix = 'let initialCFreeability: Bool'
		}

		for (const [_, currentField] of Object.entries(type.fields)) {
			fieldAccessors += this.generateAccessor(currentField, type);
		}


		// THIS IS ALL CODE TO DETECT CONSTRUCTORS WITH DUPLICATE SIGNATURES
		const conflictingArgumentConstructors = this.collectConflictingConstructors(type);
		for (const currentMethod of type.methods) {
			const isConflictingConstructor = conflictingArgumentConstructors.has(currentMethod);
			generatedMethods += this.generateMethod(currentMethod, type, isConflictingConstructor);
		}



		return `
				${containerLessPrefix}

				${this.renderDocComment(type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {

					${initialCFreeabilityInfix}

					${this.inheritedInits(type)}

					${generatedMethods}

					${fieldAccessors}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
						self.dangling = shouldDangle
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

				${containerLessSuffix}
		`;
	}

	outputDirectorySuffix(): string {
		return 'structs';
	}

}

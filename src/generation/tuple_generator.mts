import {RustTuple, RustType} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';
import Generator from './index.mjs';

export default class TupleGenerator extends BaseTypeGenerator<RustTuple> {

	generateFileContents(type: RustTuple, containerType?: RustType): string {
		const swiftTypeName = this.swiftTypeName(type);
		const swiftReturnType = this.getPublicTypeSignature(type);

		let fieldAccessors = '';
		let generatedMethods = '';

		for (const [_, currentField] of Object.entries(type.fields)) {
			fieldAccessors += this.generateAccessor(currentField, type);
		}

		for (const currentMethod of type.methods) {
			const standaloneMethodName = this.standaloneMethodName(currentMethod, type);

			if (!['free', 'clone', 'new'].includes(standaloneMethodName)) {
				let filteredTypeName = swiftTypeName.substring('Tuple_'.length, swiftTypeName.length - 'Z'.length);
				this.auxiliaryArtifacts.addMethod(currentMethod, standaloneMethodName + filteredTypeName);
			}

			generatedMethods += this.generateMethod(currentMethod, type);
		}

		let initializer = [];
		let valueAccessor = [];

		for (const [fieldIndex, currentField] of type.orderedFields.entries()) {
			let fieldAccessorName = Generator.snakeCaseToCamelCase(currentField.contextualName, true);
			initializer.push(`${currentField.contextualName}: tuple.${fieldIndex}`);
			valueAccessor.push(`self.get${fieldAccessorName}()`);
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

					internal convenience init(tuple: ${swiftReturnType}) {
						self.init(${initializer.join(', ')})
					}

					${generatedMethods}

					public func getValue() -> ${swiftReturnType} {
						return (${valueAccessor.join(', ')})
					}

					${fieldAccessors}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
						self.dangling = shouldDangle
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}
			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'tuples';
	}

}

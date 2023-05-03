import {BaseTypeGenerator} from './base_type_generator.mjs';
import {RustFunction, RustNullableOption, RustPrimitiveEnum, RustType} from '../rust_types.mjs';
import Generator from './index.mjs';

export default class NullableOptionGenerator extends BaseTypeGenerator<RustNullableOption> {
	generateFileContents(type: RustNullableOption): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';

		let someTag = '';
		let noneTag = '';

		let someInitializerMethod: RustFunction;
		let noneInitializerMethod: RustFunction;

		const tagEnumType = type.variantTag!.type as RustPrimitiveEnum;
		for (const currentTag of tagEnumType.variants) {
			if (currentTag.name.endsWith('_Some')) {
				someTag = currentTag.name;
			} else if (currentTag.name.endsWith('_None')) {
				noneTag = currentTag.name;
			} else {
				throw new Error('Unexpected nullable option tag enum variant name: ' + currentTag.name);
			}
		}

		for (const currentMethod of type.methods) {
			const standaloneMethodName = this.standaloneMethodName(currentMethod, type);
			if (standaloneMethodName === 'some') {
				someInitializerMethod = currentMethod;
				continue;
			}
			if (standaloneMethodName === 'none') {
				noneInitializerMethod = currentMethod;
				continue;
			}
			generatedMethods += this.generateMethod(currentMethod, type);
		}

		const swiftReturnType = this.getPublicTypeSignature(type.someVariant.type);
		const preparedReturnValue = this.prepareRustReturnValueForSwift(type.someVariant, type);

		const valueArgumentName = Generator.snakeCaseToCamelCase(type.someVariant.contextualName);
		const preparedArgument = this.prepareSwiftArgumentForRust(type.someVariant)

		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			${this.renderDocComment(type.documentation, 3)}
			internal typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.variantTag!.type.documentation, 4)}
				internal class ${swiftTypeName}: NativeTypeWrapper {

					${this.inheritedInits(type)}

					internal init(${valueArgumentName}: ${swiftReturnType}?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
							${Generator.reindentCode(preparedArgument.conversion, 7)}
							self.cType = ${preparedArgument.methodCallWrapperPrefix}${someInitializerMethod!.name}(${preparedArgument.accessor})${preparedArgument.methodCallWrapperSuffix}
						} else {
							self.cType = ${noneInitializerMethod!.name}()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "${swiftTypeName}.swift::\\(#function):\\(#line)")
					}

					${generatedMethods}

					public func getValue() -> ${swiftReturnType}? {
						if self.cType!.tag == ${noneTag} {
							return nil
						}
						if self.cType!.tag == ${someTag} {
							return ${preparedReturnValue.wrapperPrefix}self.cType!.some${preparedReturnValue.wrapperSuffix}
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> ${swiftTypeName} {
        				self.dangling = shouldDangle
						return self
					}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

			}
		`;
	}

	protected outputDirectorySuffix(): string {
		return 'options';
	}

}

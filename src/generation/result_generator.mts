import {RustPrimitive, RustResult, RustResultValueEnum} from '../rust_types.mjs';
import {BaseTypeGenerator} from './base_type_generator.mjs';

export default class ResultGenerator extends BaseTypeGenerator<RustResult> {

	generateFileContents(type: RustResult): string {
		const swiftTypeName = this.swiftTypeName(type);

		let generatedMethods = '';

		const conflictingArgumentConstructors = this.collectConflictingConstructors(type);
		for (const currentMethod of type.methods) {
			const currentMethodName = this.swiftMethodName(currentMethod, type);
			if (currentMethodName === 'isOk') {
				// the native detour value checker is more circuitous
				continue;
			}

			const isConflictingConstructor = conflictingArgumentConstructors.has(currentMethod);
			generatedMethods += this.generateMethod(currentMethod, type, isConflictingConstructor);
		}

		const valueEnum = type.valueField.type as RustResultValueEnum;
		const preparedErrorReturnValue = this.prepareRustReturnValueForSwift(valueEnum.errorVariant, type);
		const preparedSuccessReturnValue = this.prepareRustReturnValueForSwift(valueEnum.resultVariant, type);

		let successTypeSignature = this.getPublicTypeSignature(valueEnum.resultVariant.type);
		let errorTypeSignature = this.getPublicTypeSignature(valueEnum.errorVariant.type);

		let successBlockCommentPrefix = '';
		let successBlockCommentSuffix = '';
		let failureBlockCommentPrefix = '';
		let failureBlockCommentSuffix = '';

		if(valueEnum.resultVariant.type instanceof RustPrimitive && valueEnum.resultVariant.type.swiftRawSignature === 'Void'){
			successBlockCommentPrefix = '/*'
			successBlockCommentSuffix = '*/'
		}
		if(valueEnum.errorVariant.type instanceof RustPrimitive && valueEnum.errorVariant.type.swiftRawSignature === 'Void'){
			failureBlockCommentPrefix = '/*'
			failureBlockCommentSuffix = '*/'
		}

		if (!successTypeSignature.endsWith('?')) {
			// it's always an optional
			successTypeSignature += '?';
		}

		if (!errorTypeSignature.endsWith('?')) {
			// it's always an optional
			errorTypeSignature += '?';
		}



		return `
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			${this.renderDocComment(type.documentation, 3)}
			public typealias ${swiftTypeName} = Bindings.${swiftTypeName}

			extension Bindings {

				${this.renderDocComment(type.documentation, 4)}
				public class ${swiftTypeName}: NativeTypeWrapper {

					${this.inheritedInits(type)}

					${generatedMethods}

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					${failureBlockCommentPrefix}
					public func getError() -> ${errorTypeSignature} {
						if self.cType?.result_ok == false {
							return ${preparedErrorReturnValue.wrapperPrefix}self.cType!.contents.err${preparedErrorReturnValue.wrapperSuffix}
						}
						return nil
					}
					${failureBlockCommentSuffix}

					${successBlockCommentPrefix}
					public func getValue() -> ${successTypeSignature} {
						if self.cType?.result_ok == true {
							return ${preparedSuccessReturnValue.wrapperPrefix}self.cType!.contents.result${preparedSuccessReturnValue.wrapperSuffix}
						}
						return nil
					}
					${successBlockCommentSuffix}

					${this.renderDanglingCloneAndDeinitMethods(type)}

				}

			}
		`;
	}

	outputDirectorySuffix(): string {
		return 'results';
	}

}

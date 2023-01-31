import * as chai from 'chai';
import Config from '../src/config.mjs';

import * as url from 'url';
import Parser from '../src/parser.mjs';
import {
	ContextualRustType,
	OpaqueRustStruct,
	RustLambda,
	RustNullableOption,
	RustPrimitive,
	RustPrimitiveEnum,
	RustPrimitiveEnumVariant,
	RustPrimitiveWrapper,
	RustResult,
	RustResultValueEnum,
	RustStruct,
	RustTaggedValueEnum,
	RustTrait,
	RustVector
} from '../src/rust_types.mjs';
import {describe} from 'mocha';
import Generator from '../src/generation/index.mjs';

class TestConfig extends Config {
	private headerPath: string;

	constructor(headerPath: string) {
		super();
		this.headerPath = headerPath;
	}

	override getHeaderPath(): string {
		return this.headerPath;
	}
}

describe('Parser Tests', () => {

	describe('Vector Parsing Tests', () => {
		it('should parse a vector 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/vector_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);
		});

		it('should parse a vector 02', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/vector_test_02.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);
		});

		it('should parse a vector 03', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/vector_test_03.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(4);
			chai.expect(glossaryKeys).contains('LDKCVec_RouteHopZ');
			chai.expect(glossaryKeys).contains('LDKCVec_CVec_RouteHopZZ');

			const routeHopArrayArray = glossary['LDKCVec_CVec_RouteHopZZ'];
			chai.assert(routeHopArrayArray instanceof RustVector);
			chai.assert(routeHopArrayArray.iterateeField instanceof ContextualRustType);
			chai.assert(routeHopArrayArray.lengthField instanceof ContextualRustType);
			chai.expect(routeHopArrayArray.lengthField.contextualName).equals('datalen');

			const routeHopArray = glossary['LDKCVec_RouteHopZ'];
			chai.expect(routeHopArrayArray.iterateeField.type).equals(routeHopArray);
			chai.assert(routeHopArray instanceof RustVector);
			chai.expect(routeHopArray.iterateeField.type).equals(glossary['LDKRouteHop']);
		});

		it('should parse a vector 04', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/vector_test_04.h`);
			const parser = new Parser(config);
			parser.parse();

			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);
		});
	});

	describe('Tuple Parsing Tests', () => {
		it('should parse first tuple', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/tuple_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(2);
		})

	});

	describe('Binary Option Parsing Tests', () => {
		it('should parse a binary option 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/binary_option_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(2);
			chai.expect(glossaryKeys).contains('LDKCOption_u32Z');
			chai.expect(glossaryKeys).contains('LDKCOption_u32Z_Tag');

			const option = <RustNullableOption>glossary['LDKCOption_u32Z'];
			chai.assert(option instanceof RustNullableOption);
			chai.assert(option.someVariant instanceof ContextualRustType);
			chai.assert(option.variantTag instanceof ContextualRustType);
			chai.expect(option.variantTag.contextualName).equals('tag');
			chai.expect(option.variantTag.type).equals(glossary['LDKCOption_u32Z_Tag']);
			chai.expect(option.someVariant.contextualName).equals('some');
			chai.assert(option.someVariant.type instanceof RustPrimitive);
		});
	});

	describe('Value Enum Parsing Tests', () => {
		it('should parse tagged value enum 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/tagged_value_enum_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(2);
			chai.expect(glossaryKeys).contains('LDKBech32Error_Tag');
			chai.expect(glossaryKeys).contains('LDKBech32Error');

			const errorTag = <RustPrimitiveEnum>glossary['LDKBech32Error_Tag'];
			chai.assert(errorTag instanceof RustPrimitiveEnum);
			chai.expect(errorTag.variants.length).equals(7);
			const tagVariantNames = new Set<string>();
			for (const currentVariant of errorTag.variants) {
				chai.assert(currentVariant instanceof RustPrimitiveEnumVariant);
				chai.expect(currentVariant.name).matches(/^LDKBech32Error_.+$/);
				chai.expect(currentVariant.documentation.length).greaterThanOrEqual(36);
				tagVariantNames.add(currentVariant.name);
			}

			const errorEnum = <RustTaggedValueEnum>glossary['LDKBech32Error'];
			chai.assert(errorEnum instanceof RustTaggedValueEnum);

			const variantKeys = Object.keys(errorEnum.variants);
			chai.expect(variantKeys.length).equals(2);

			for (const [variantName, currentVariant] of Object.entries(errorEnum.variants)) {
				chai.assert(currentVariant instanceof ContextualRustType);
				chai.expect(currentVariant.contextualName).equals(variantName);

				const camelCasedVariantName = Generator.snakeCaseToCamelCase(variantName, true);
				const expectedTaggedEnumVariantName = `${errorEnum.name}_${camelCasedVariantName}`;
				chai.expect(tagVariantNames).contains(expectedTaggedEnumVariantName);
			}
		});

		it('should parse tagged value enum 02', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/tagged_value_enum_test_02.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(4);

			const paymentPurpose = glossary['LDKPaymentPurpose'];
			chai.assert(paymentPurpose instanceof RustTaggedValueEnum);

			const purposeTag = glossary['LDKPaymentPurpose_Tag'];
			chai.assert(purposeTag instanceof RustPrimitiveEnum);

			const invoicePaymentVariant = paymentPurpose.variants['invoice_payment'];
			const spontaneousPaymentVariant = paymentPurpose.variants['spontaneous_payment'];
			chai.assert(invoicePaymentVariant instanceof ContextualRustType);
			chai.expect(invoicePaymentVariant.type).equals(glossary['LDKPaymentPurpose_LDKInvoicePayment_Body']);
			chai.assert(spontaneousPaymentVariant instanceof ContextualRustType);
			chai.expect(spontaneousPaymentVariant.type).equals(glossary['LDKThirtyTwoBytes']);
		});
	});

	describe('Result Parsing Tests', () => {
		it('should parse result 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/result_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(4);

			const result = <RustResult>glossary['LDKCResult_BlindedRouteNoneZ'];
			const resultEnum = <RustResultValueEnum>glossary['LDKCResult_BlindedRouteNoneZPtr'];
			chai.assert(result instanceof RustResult);
			chai.assert(resultEnum instanceof RustResultValueEnum);
			chai.expect(result.documentation)
			.equals('A CResult_BlindedRouteNoneZ represents the result of a fallible operation,\ncontaining a crate::lightning::onion_message::blinded_route::BlindedRoute on success and a () on failure.\n`result_ok` indicates the overall state, and the contents are provided via `contents`.');
			chai.expect(resultEnum.documentation).equals('The contents of CResult_BlindedRouteNoneZ');

			chai.assert(result.tagField instanceof ContextualRustType);
			chai.assert(result.valueField instanceof ContextualRustType);
			chai.expect(result.tagField.contextualName).equals('result_ok');
			chai.expect(result.tagField.documentation)
			.equals('Whether this CResult_BlindedRouteNoneZ represents a success state.');

			chai.assert(result.tagField.type instanceof RustPrimitive);
			chai.expect(result.tagField.type.cSignature).equals('bool');
			chai.expect(result.tagField.type.swiftRawSignature).equals('Bool');

			chai.expect(result.valueField.type).equals(resultEnum);

			chai.assert(resultEnum.errorVariant.type instanceof RustPrimitive);
			chai.expect(resultEnum.resultVariant.type).equals(glossary['LDKBlindedRoute']);
		});
	});

	describe('Trait Parsing Tests', () => {
		xit('should parse trait 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/trait_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(3);
			chai.expect(glossaryKeys).contains('LDKRecord');
			chai.expect(glossaryKeys).contains('LDKLogger');

			const ldkRecord = glossary['LDKRecord'];
			chai.assert(ldkRecord instanceof RustStruct);
			chai.expect(ldkRecord.name).equals('LDKRecord');
			chai.expect(ldkRecord.documentation)
			.equals('A Record, unit of logging output with Metadata to enable filtering\nModule_path, file, line to inform on log\'s source');

			const recordFieldKeys = Object.keys(ldkRecord.fields);
			chai.expect(recordFieldKeys.length).equals(2);

			const innerField = ldkRecord.fields['inner'];
			chai.assert(innerField instanceof ContextualRustType);
			chai.expect(innerField.contextualName).equals('inner');
			chai.expect(innerField.documentation)
			.equals('A pointer to the opaque Rust object.\nNearly everywhere, inner must be non-null, however in places where\nthe Rust equivalent takes an Option, it may be set to null to indicate None.');
			chai.expect(innerField.isAsteriskPointer).equals(true);

			const innerType = innerField.type;
			chai.assert(innerType instanceof OpaqueRustStruct);
			chai.expect(innerType.name).equals('LDKnativeRecord');

			const isOwnedField = ldkRecord.fields['is_owned'];
			chai.assert(isOwnedField instanceof ContextualRustType);
			chai.expect(isOwnedField.contextualName).equals('is_owned');
			chai.expect(isOwnedField.documentation)
			.equals('Indicates that this is the only struct which contains the same pointer.\nRust functions which take ownership of an object provided via an argument require\nthis to be true and invalidate the object pointed to by inner.');

			const isOwnedType = isOwnedField.type;
			chai.assert(isOwnedType instanceof RustPrimitive);
			chai.expect(isOwnedType.cSignature).equals('bool');
			chai.expect(isOwnedType.swiftRawSignature).equals('Bool');

			const ldkLogger = glossary['LDKLogger'];
			chai.assert(ldkLogger instanceof RustTrait);
			chai.expect(ldkLogger.name).equals('LDKLogger');
			chai.expect(ldkLogger.documentation).equals('A trait encapsulating the operations required of a logger');

			const identifier = ldkLogger.identifierField;
			chai.assert(identifier instanceof ContextualRustType);
			chai.expect(identifier.contextualName).equals('this_arg');
			chai.expect(identifier.documentation)
			.equals('An opaque pointer which is passed to your function implementations as an argument.\nThis has no meaning in the LDK, and can be NULL or any other value.');

			const identifierType = identifier.type;
			chai.assert(identifierType instanceof RustPrimitive);
			chai.expect(identifierType.cSignature).equals('void');
			chai.expect(identifierType.swiftRawSignature).equals('Void');

			chai.expect(ldkLogger.lambdas.length).equals(2);
			const logLambda = ldkLogger.lambdas[0];
			const freeLambda = ldkLogger.lambdas[1];

			chai.assert(logLambda instanceof RustLambda);
			chai.assert(freeLambda instanceof RustLambda);

			chai.expect(logLambda.name).equals('log');
			chai.expect(freeLambda.name).equals('free');

			chai.expect(logLambda.documentation).equals('Logs the `Record`');
			chai.expect(freeLambda.documentation)
			.equals('Frees any resources associated with this object given its this_arg pointer.\nDoes not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.');

			chai.assert(logLambda.returnValue.type instanceof RustPrimitive);
			chai.assert(freeLambda.returnValue.type instanceof RustPrimitive);

			const logArguments = logLambda.arguments;
			chai.expect(logArguments.length).equals(1);

			const logArgument = logArguments[0];
			chai.assert(logArgument instanceof ContextualRustType);
			chai.expect(logArgument.contextualName).equals('record');
			chai.expect(logArgument.isNonnullablePointer).equals(true);
			chai.expect(logArgument.isConstant).equals(true);
			chai.expect(logArgument.isAsteriskPointer).equals(true);
			chai.expect(logArgument.type).equals(ldkRecord);
		});

		xit('should parse trait 02', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/trait_test_02.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			chai.expect(glossaryKeys.length).equals(11);

			const writeableScore = glossary['LDKWriteableScore'];
			chai.assert(writeableScore instanceof RustTrait);
			chai.expect(writeableScore.lambdas.length).equals(2);

			const fieldKeys = Object.keys(writeableScore.fields);
			chai.expect(fieldKeys).length(1);
			chai.expect(writeableScore.fields).key('LockableScore');

			const lockableScoreField = writeableScore.fields['LockableScore'];
			chai.expect(lockableScoreField).instanceof(ContextualRustType);
			chai.expect(lockableScoreField.type).equals(glossary['LDKLockableScore']);
		});

		it('should parse trait 03', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/trait_test_03.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);
		});
	});

	describe('Primitive Array Wrapper Struct Parsing Tests', () => {
		it('should parse several primitive array wrappers 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/parsing/array_wrapper_test_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			// false positive tests
			const vector = glossary['LDKCVec_u8Z'];
			const nextHopBody = glossary['LDKHTLCDestination_LDKUnknownNextHop_Body']
			const error = glossary['LDKError']
			chai.expect(vector).not.instanceof(RustPrimitiveWrapper);
			chai.expect(vector).instanceof(RustVector);
			chai.expect(nextHopBody).not.instanceof(RustPrimitiveWrapper);
			chai.expect(nextHopBody).instanceof(RustStruct);
			chai.expect(error).not.instanceof(RustPrimitiveWrapper);
			chai.expect(error).instanceof(RustStruct);

			const string = glossary['LDKStr'];
			chai.assert(string instanceof RustPrimitiveWrapper);
			chai.expect(string.dataField.contextualName).equals('chars');
			chai.assert(!!string.lengthField);
			chai.expect(string.lengthField.contextualName).equals('len');
			chai.assert(!!string.ownershipField);
			chai.expect(string.ownershipField.contextualName).equals('chars_is_owned');

			const bigEndianScalar = glossary['LDKBigEndianScalar'];
			chai.assert(bigEndianScalar instanceof RustPrimitiveWrapper);
			chai.expect(bigEndianScalar.dataField.contextualName).equals('big_endian_bytes');
			chai.assert(!bigEndianScalar.lengthField);
			chai.assert(!bigEndianScalar.ownershipField);

			const thirtyTwoBytes = glossary['LDKThirtyTwoBytes'];
			chai.assert(thirtyTwoBytes instanceof RustPrimitiveWrapper);
			chai.expect(thirtyTwoBytes.dataField.contextualName).equals('data');
			chai.assert(!thirtyTwoBytes.lengthField);
			chai.assert(!thirtyTwoBytes.ownershipField);

			const u5 = glossary['LDKU5'];
			chai.assert(u5 instanceof RustPrimitiveWrapper);
			chai.expect(u5.dataField.contextualName).equals('_0');
			chai.assert(!u5.lengthField);
			chai.assert(!u5.ownershipField);

			const witnessVersion = glossary['LDKWitnessVersion'];
			chai.assert(witnessVersion instanceof RustPrimitiveWrapper);
			chai.expect(witnessVersion.dataField.contextualName).equals('_0');
			chai.assert(!witnessVersion.lengthField);
			chai.assert(!witnessVersion.ownershipField);

			const transaction = glossary['LDKTransaction'];
			chai.assert(transaction instanceof RustPrimitiveWrapper);
			chai.expect(transaction.dataField.contextualName).equals('data');
			chai.assert(transaction.lengthField);
			chai.expect(transaction.lengthField.contextualName).equals('datalen');
			chai.assert(transaction.ownershipField);
			chai.expect(transaction.ownershipField.contextualName).equals('data_is_owned');

			const secretKey = glossary['LDKSecretKey'];
			chai.assert(secretKey instanceof RustPrimitiveWrapper);
			chai.expect(secretKey.dataField.contextualName).equals('bytes');
			chai.assert(!secretKey.lengthField);
			chai.assert(!secretKey.ownershipField);

			const signature = glossary['LDKSignature'];
			chai.assert(signature instanceof RustPrimitiveWrapper);
			chai.expect(signature.dataField.contextualName).equals('compact_form');
			chai.assert(!signature.lengthField);
			chai.assert(!signature.ownershipField);

			const recoverableSignature = glossary['LDKRecoverableSignature'];
			chai.assert(recoverableSignature instanceof RustPrimitiveWrapper);
			chai.expect(recoverableSignature.dataField.contextualName).equals('serialized_form');
			chai.assert(!recoverableSignature.lengthField);
			chai.assert(!recoverableSignature.ownershipField);
		});
	});

	describe('Complete Parser Tests', () => {
		it('should parse everything completely', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/../res/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const primitiveWrapperTypes = new Set<RustPrimitiveWrapper>();
			for (const [_, currentType] of Object.entries(glossary)) {
				if (currentType instanceof RustPrimitiveWrapper) {
					primitiveWrapperTypes.add(currentType);
				}
			}

			for (const currentWrapper of primitiveWrapperTypes) {
				console.log(currentWrapper.name);
				console.dir({
					dataField: currentWrapper.dataField ? currentWrapper.dataField.contextualName : null,
					lengthField: currentWrapper.lengthField ? currentWrapper.lengthField.contextualName : null,
					ownershipField: currentWrapper.ownershipField ? currentWrapper.ownershipField.contextualName : null
				});
			}
		});
	});

});

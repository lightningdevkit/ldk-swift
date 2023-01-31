import url from 'url';
import Parser from '../src/parser.mjs';
import Config from '../src/config.mjs';
import StructGenerator from '../src/generation/struct_generator.mjs';
import {describe} from 'mocha';
import {
	RustNullableOption,
	RustPrimitiveEnum,
	RustPrimitiveWrapper,
	RustResult,
	RustStruct,
	RustTaggedValueEnum, RustTrait,
	RustVector
} from '../src/rust_types.mjs';
import NullableOptionGenerator from '../src/generation/nullable_option_generator.mjs';
import VectorGenerator from '../src/generation/vector_generator.mjs';
import ComplexEnumGenerator from '../src/generation/complex_enum_generator.mjs';
import ResultGenerator from '../src/generation/result_generator.mjs';
import PrimitiveWrapperGenerator from '../src/generation/primitive_wrapper_generator.mjs';
import * as chai from 'chai';
import PrimitiveEnumGenerator from '../src/generation/primitive_enum_generator.mjs';
import {AuxiliaryArtifacts} from '../src/generation/index.mjs';
import TraitGenerator from '../src/generation/trait_generator.mjs';

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

describe('Generator Tests', () => {

	describe('Struct Generation Tests', () => {
		it('should generate ChainMonitor partially', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/chain_monitor_test_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const chainMonitor = <RustStruct>parser.glossary['LDKChainMonitor'];
			const generator = new StructGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(chainMonitor);

			chai.expect(output).contains('public typealias ChainMonitor = Bindings.ChainMonitor');
			chai.expect(output).contains('internal var cType: LDKChainMonitor?');
			chai.expect(output).contains('public init(chainSource: Filter?) {');
			chai.expect(output).contains('public func getClaimableBalances() -> [UInt8] {');
			chai.expect(output).contains('internal func free() {');

			chai.expect(output).contains('let chainSourceOption = Option_FilterZ(some: chainSource)');
			chai.expect(output).contains('let nativeCallResult = ChainMonitor_free(self.cType!)');
		});

		it('should generate ChainMonitor completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const chainMonitor = <RustStruct>parser.glossary['LDKChainMonitor'];
			const generator = new StructGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(chainMonitor);
			// debugger
		});
	});

	describe('Nullable Option Generation Tests', () => {
		it('should generate binary option 01', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/option_u32_test.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const option = <RustNullableOption>glossary['LDKCOption_u32Z'];
			const generator = new NullableOptionGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(option);
			// debugger
		});
	});

	describe('Vector Generation Tests', () => {
		it('should generate Vec<Vec<RouteHop>>', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/vec_vec_route_hop_test.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const routeVectorVector = <RustVector>glossary['LDKCVec_CVec_RouteHopZZ'];
			const generator = new VectorGenerator(config, new AuxiliaryArtifacts());
			const vectorVectorOutput = generator.generateFileContents(routeVectorVector);

			chai.expect(vectorVectorOutput).includes('public init(array: [[RouteHop]]) {');
			chai.expect(vectorVectorOutput)
			.includes('let dataContainer = UnsafeMutablePointer<LDKCVec_RouteHopZ>.allocate(capacity: array.count)');
			chai.expect(vectorVectorOutput)
			.includes('dataContainer.initialize(from: lowerDimension, count: array.count)');
			chai.expect(vectorVectorOutput)
			.includes('let vector = LDKCVec_CVec_RouteHopZZ(data: dataContainer, datalen: UInt(array.count))');
			chai.expect(vectorVectorOutput).includes('self.cType = vector');

			chai.expect(vectorVectorOutput).includes('public func getValue() -> [[RouteHop]] {');
			chai.expect(vectorVectorOutput).includes('var array = [[LDKRouteHop]]()');
			chai.expect(vectorVectorOutput).includes('let currentEntry1 = self.cType!.data[index1]');
			chai.expect(vectorVectorOutput).includes('var convertedEntry1 = [LDKRouteHop]()');
			chai.expect(vectorVectorOutput).includes('let currentEntry2 = currentEntry1.data[index2]');
			chai.expect(vectorVectorOutput).includes('convertedEntry1.append(currentEntry2)');
			chai.expect(vectorVectorOutput).includes('let swiftArray = array.map { (currentCType: [LDKRouteHop]) -> [RouteHop] in');
			chai.expect(vectorVectorOutput).includes('currentCType.map { (currentCType: LDKRouteHop) -> RouteHop in');
			chai.expect(vectorVectorOutput).includes('RouteHop(cType: currentCType, anchor: self).dangle()');

			const routeVector = <RustVector>glossary['LDKCVec_RouteHopZ'];
			const vectorOutput = generator.generateFileContents(routeVector);
			chai.expect(vectorOutput).includes('public init(array: [RouteHop]) {');
			chai.expect(vectorOutput).includes('let rustArray = array.map { (currentValueDepth1: RouteHop) -> LDKRouteHop in');
			chai.expect(vectorOutput).includes('return currentValueDepth1.cType!');
			chai.expect(vectorOutput)
			.includes('let dataContainer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: array.count)');
			chai.expect(vectorOutput)
			.includes('let vector = LDKCVec_RouteHopZ(data: dataContainer, datalen: UInt(array.count))');

			chai.expect(vectorOutput).includes('public func getValue() -> [RouteHop] {');
			chai.expect(vectorOutput).includes('var array = [LDKRouteHop]()');
			chai.expect(vectorOutput).includes('let swiftArray = array.map { (currentCType: LDKRouteHop) -> RouteHop in');
			chai.expect(vectorOutput).includes('RouteHop(cType: currentCType, anchor: self).dangle()');
		});

		it('should generate Vec<u8>', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/vec_u8_test.h`);
			const parser = new Parser(config);
			parser.parse();
			const glossary = parser.glossary;
			const glossaryKeys = Object.keys(glossary);

			const routeVectorVector = <RustVector>glossary['LDKCVec_u8Z'];
			const generator = new VectorGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(routeVectorVector);

			chai.expect(output).includes('public init(array: [UInt8]) {');
			chai.expect(output)
			.includes('let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)');
			chai.expect(output).includes('dataContainer.initialize(from: array, count: array.count)');
			chai.expect(output).includes('let vector = LDKCVec_u8Z(data: dataContainer, datalen: UInt(array.count))');
			chai.expect(output).includes('self.cType = vector');

			chai.expect(output).includes('public func getValue() -> [UInt8] {');
			chai.expect(output).includes('var array = [UInt8]()');
			chai.expect(output).includes('let currentEntry1 = self.cType!.data[index1]');
			chai.expect(output).includes('let swiftArray = array');
			chai.expect(output).includes('return swiftArray');
		});
	});

	describe('Primitive Enum Generation Tests', () => {
		it('should generate primitive enums', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/generation/enum_test_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new PrimitiveEnumGenerator(config, new AuxiliaryArtifacts());

			const optionTag = <RustPrimitiveEnum>parser.glossary['LDKCOption_u32Z_Tag'];
			const accessError = <RustPrimitiveEnum>parser.glossary['LDKAccessError'];
			const monitorUpdateStatus = <RustPrimitiveEnum>parser.glossary['LDKChannelMonitorUpdateStatus'];

			chai.assert.throws(() => {
				generator.generateFileContents(optionTag);
			});

			const accessErrorOutput = generator.generateFileContents(accessError);
			chai.expect(accessErrorOutput).includes('internal init (value: LDKAccessError) {');
			chai.expect(accessErrorOutput).includes('self = .UnknownTx');
			chai.expect(accessErrorOutput).includes('case LDKAccessError_UnknownTx:');
			chai.expect(accessErrorOutput).includes('internal func getCValue() -> LDKAccessError {');
			chai.expect(accessErrorOutput).includes('case .UnknownChain:');
			chai.expect(accessErrorOutput).includes('return LDKAccessError_UnknownChain');

			const monitorUpdateStatusOutput = generator.generateFileContents(monitorUpdateStatus);
			chai.expect(monitorUpdateStatusOutput).includes('internal init (value: LDKChannelMonitorUpdateStatus) {');
			chai.expect(monitorUpdateStatusOutput).includes('self = .PermanentFailure');
			chai.expect(monitorUpdateStatusOutput).includes('case LDKChannelMonitorUpdateStatus_Completed:');
			chai.expect(monitorUpdateStatusOutput).includes('internal func getCValue() -> LDKChannelMonitorUpdateStatus {');
			chai.expect(monitorUpdateStatusOutput).includes('case .Completed:');
			chai.expect(monitorUpdateStatusOutput).includes('return LDKChannelMonitorUpdateStatus_Completed');
		});
	});

	describe('Complex Enum Generation Tests', () => {
		it('should generate payment send failure completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const paymentSendFailure = <RustTaggedValueEnum>parser.glossary['LDKPaymentSendFailure'];
			const generator = new ComplexEnumGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(paymentSendFailure);
			// debugger
		});
	});

	describe('Result Generation Tests', () => {
		it('should generate channel config decore error completely', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const channelConfigDecodeError = <RustResult>parser.glossary['LDKCResult_ChannelConfigDecodeErrorZ'];
			const generator = new ResultGenerator(config, new AuxiliaryArtifacts());
			const output = generator.generateFileContents(channelConfigDecodeError);
		});
	});

	describe('Primitive Wrapper Generation Tests', () => {
		it('should generate LDKU5', () => {
			// only the new and get_claimable_balances methods are present
			// some parameters have been removed
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new PrimitiveWrapperGenerator(config, new AuxiliaryArtifacts());

			const ldku5 = <RustPrimitiveWrapper>parser.glossary['LDKU5'];
			const ldkStr = <RustPrimitiveWrapper>parser.glossary['LDKStr'];
			const thirtyTwoBytes = <RustPrimitiveWrapper>parser.glossary['LDKThirtyTwoBytes'];
			const transaction = <RustPrimitiveWrapper>parser.glossary['LDKTransaction'];

			const transactionOutput = generator.generateFileContents(transaction);
			const thirtyTwoBytesOutput = generator.generateFileContents(thirtyTwoBytes);
			const strOutput = generator.generateFileContents(ldkStr);
			const u5Output = generator.generateFileContents(ldku5);

			chai.expect(transactionOutput).includes('public init(value: [UInt8]) {');
			chai.expect(transactionOutput).includes('public func getValue() -> [UInt8] {');
			chai.expect(transactionOutput)
			.includes('self.cType = LDKTransaction(data: dataContainer, datalen: UInt(value.count), data_is_owned: true)');

			chai.expect(thirtyTwoBytesOutput).includes('public init(value: [UInt8]) {');
			chai.expect(thirtyTwoBytesOutput).includes('public func getValue() -> [UInt8] {');
			chai.expect(thirtyTwoBytesOutput)
			.includes('self.cType = LDKThirtyTwoBytes(data: Bindings.arrayToUInt8Tuple32(array: value))');

			chai.expect(thirtyTwoBytesOutput)
			.includes('return Bindings.UInt8Tuple32ToArray(tuple: self.cType!.data)');

			chai.expect(strOutput).includes('public init(value: String) {');
			chai.expect(strOutput).includes('public func getValue() -> String {');
			chai.expect(strOutput)
			.includes('self.cType = LDKStr(chars: Bindings.string_to_unsafe_uint8_pointer(string: value), len: UInt(value.count), chars_is_owned: true)');

			chai.expect(strOutput).includes('return String(data: data, encoding: .utf8)!');

			chai.expect(u5Output).includes('public init(value: UInt8) {');
			chai.expect(u5Output).includes('public func getValue() -> UInt8 {');
			chai.expect(u5Output).includes('self.cType = LDKU5(_0: value)');
			chai.expect(u5Output).includes('return self.cType!._0');
		});
	});

	describe('Trait Generation Tests', () => {
		it('should generate FeeEstimator', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new TraitGenerator(config, new AuxiliaryArtifacts());
			const feeest = <RustTrait>parser.glossary['LDKFeeEstimator'];
			const output = generator.generateFileContents(feeest);

			chai.expect(output).includes('public init() {');
			chai.expect(output).includes('self.cType = LDKFeeEstimator(');
			chai.expect(output).includes('get_est_sat_per_1000_weight: getEstSatPer1000WeightLambda,');
			chai.expect(output).includes('open func getEstSatPer1000Weight(confirmationTarget: ConfirmationTarget) -> UInt32 {');
		});
		it('should generate BaseSign completely', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new TraitGenerator(config, new AuxiliaryArtifacts());
			const baseSign = <RustTrait>parser.glossary['LDKBaseSign'];
			const output = generator.generateFileContents(baseSign);
		});

		it('should generate Router completely', () => {
			const __dirname = url.fileURLToPath(new URL('.', import.meta.url));
			const config = new TestConfig(`${__dirname}/fixtures/lightning_01.h`);
			const parser = new Parser(config);
			parser.parse();

			const generator = new TraitGenerator(config, new AuxiliaryArtifacts());
			const router = <RustTrait>parser.glossary['LDKRouter'];
			const output = generator.generateFileContents(router);
		});
	});

});

//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

public typealias LDKTransactionOutputs = LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias LDKTxid = LDKThirtyTwoBytes

open class NativeTypeWrapper: Hashable {

    enum AnchorError: Error {
        case cyclicReference
    }

    private static var globalInstanceCounter: UInt = 0
    internal let globalInstanceNumber: UInt
    internal var dangling = false
    internal private(set) var anchors: Set<NativeTypeWrapper> = []
    internal var pointerDebugDescription: String? = nil

    init(conflictAvoidingVariableName: UInt) {
        Self.globalInstanceCounter += 1
        self.globalInstanceNumber = Self.globalInstanceCounter
    }

    internal func addAnchor(anchor: NativeTypeWrapper) throws {
        if self.hasAnchor(candidate: anchor) {
            throw AnchorError.cyclicReference
        }
        self.anchors.insert(anchor)
    }

    internal func hasAnchor(candidate: NativeTypeWrapper) -> Bool {
		if self.anchors.count == 0 {
			return false
		}
		if self.anchors.contains(candidate) {
			return true
		}
		for currentAnchor in self.anchors {
			if currentAnchor.hasAnchor(candidate: candidate) {
				return true
			}
		}
		return false
	}

    public static func == (lhs: NativeTypeWrapper, rhs: NativeTypeWrapper) -> Bool {
        return (lhs.globalInstanceNumber == rhs.globalInstanceNumber)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(globalInstanceNumber)
    }

}

public class Bindings {

	internal static var minimumPrintSeverity: PrintSeverity = .WARNING

    public enum PrintSeverity: UInt {
        case DEBUG = 0
        case WARNING = 1
        case ERROR = 2
    }

    internal class func print(_ string: String, severity: PrintSeverity = .DEBUG) {
        if severity.rawValue >= Self.minimumPrintSeverity.rawValue {
            Swift.print(string)
        }
    }

    public class func setLogThreshold(severity: PrintSeverity){
        Self.minimumPrintSeverity = severity
    }

	/* BYTE_ARRAY_METHODS_START */
	public class func new_LDKByteType(array: [UInt8]) -> LDKByteType {
		let byteType = LDKByteType(fieldName: (tupleArguments))
		// let wrapper = LDKByteTypeWrapper(pointer: byteType)
		return byteType
	}

	public class func LDKByteType_to_array(nativeType: LDKByteType) -> [UInt8] {
		let array = [tupleReads]
		return array
	}
	/*
	public class LDKByteTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		public var cOpaqueStruct: LDKByteType?

		public init(pointer: LDKByteType){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal func dangle() -> LDKByteTypeWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKByteTypeWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.fieldName.deallocate()
			} else {
				print("Not freeing LDKByteTypeWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	*/
	/* BYTE_ARRAY_METHODS_END */

	/* VECTOR_METHODS_START */
	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_rust_primitiveWrapper(array: [SwiftPrimitive]) -> LDKCVec_rust_primitiveWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<SwiftPrimitive>) -> UnsafeMutablePointer<SwiftPrimitive> in
            let mutablePointer = UnsafeMutablePointer<SwiftPrimitive>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<SwiftPrimitive>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

        let vector = LDKCVec_rust_primitive(data: dataContainer, datalen: UInt(array.count))
        let wrapper = LDKCVec_rust_primitiveWrapper(pointer: vector)
        return wrapper
    }

    public class LDKCVec_rust_primitiveWrapper: NativeTypeWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCVec_rust_primitive?
		internal var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKCVec_rust_primitive){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		internal init(pointer: LDKCVec_rust_primitive, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public func noOpRetain(){}

		internal func dangle(dangleSubdimensions: Bool = true) -> LDKCVec_rust_primitiveWrapper {
			self.dangling = true
			/* SUBDIMENSION_DANGLE_PREP */
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKCVec_rust_primitiveWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKCVec_rust_primitiveWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
    /* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
    public class func LDKCVec_rust_primitive_to_array(nativeType: LDKCVec_rust_primitive) -> [SwiftPrimitive] {
		var array = [SwiftPrimitive]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(convertedEntry)
		}
		/* RUST_PRIMITIVE_CLEANUP */
		return array
	}
	/* RUST_TO_SWIFT_END */
	/* VECTOR_METHODS_END */

	/* STATIC_METHODS_START */
	public class func methodName(swift_arguments) -> Void {
		/* STATIC_METHOD_BODY */
	}
	/* STATIC_METHODS_END */

	static var nativelyExposedInstances = [String: NativeTypeWrapper]()

	public class func instanceToPointer(instance: NativeTypeWrapper) -> UnsafeMutableRawPointer {
		let pointer = Unmanaged.passUnretained(instance).toOpaque()
        instance.pointerDebugDescription = pointer.debugDescription
		Self.nativelyExposedInstances[pointer.debugDescription] = instance
		return pointer
	}

	public class func pointerToInstance<T: NativeTypeWrapper>(pointer: UnsafeRawPointer, sourceMarker: String?) -> T{

		let callStack = Thread.callStackSymbols
		let caller = sourceMarker ?? callStack[1]
		// print("Retrieving instance from pointer for caller: \(caller)")
		// let value = Unmanaged<T>.fromOpaque(pointer).takeUnretainedValue()
		let value = Self.nativelyExposedInstances[pointer.debugDescription] as! T
		// print("Instance retrieved for caller: \(caller)")
		return value
	}

    public class func removeInstancePointer(instance: NativeTypeWrapper) -> Bool {
        guard let debugDescription = instance.pointerDebugDescription else {
            return false
        }
        Self.nativelyExposedInstances.removeValue(forKey: debugDescription)
        instance.pointerDebugDescription = nil
        return true
    }

    public class func clearInstancePointers() {
        for (_, currentInstance) in Self.nativelyExposedInstances {
            currentInstance.pointerDebugDescription = nil
        }
        Self.nativelyExposedInstances.removeAll()
    }

	/* SWIFT_TO_RUST_START */
	public class func new_LDKTransactionWrapper(array: [UInt8]) -> LDKTransactionWrapper {
		/* DIMENSION_REDUCTION_PREP */

		/*
		let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
			let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
			return mutablePointer
		}
		*/

		let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
		dataContainer.initialize(from: array, count: array.count)

		let vector = LDKTransaction(data: dataContainer, datalen: UInt(array.count), data_is_owned: true)
		let wrapper = LDKTransactionWrapper(pointer: vector)
		return wrapper
	}

	public class LDKTransactionWrapper {
		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt
		internal private(set) var dangling = false

		internal var cOpaqueStruct: LDKTransaction?
		internal private(set) var subdimensionWrapper: [AnyObject]? = nil

		public init(pointer: LDKTransaction){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
		}

		internal init(pointer: LDKTransaction, subdimensionWrapper: [AnyObject]){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.subdimensionWrapper = subdimensionWrapper
			self.cOpaqueStruct = pointer
		}

		public func noOpRetain(){}

		internal func dangle() -> LDKTransactionWrapper {
			self.dangling = true
			return self
		}

		deinit {
			if !self.dangling {
				print("Freeing LDKTransactionWrapper \(self.instanceNumber).")
				self.cOpaqueStruct!.data.deallocate()
			} else {
				print("Not freeing LDKTransactionWrapper \(self.instanceNumber) due to dangle.")
			}
		}
	}
	/* SWIFT_TO_RUST_END */

	/* RUST_TO_SWIFT_START */
	public class func LDKTransaction_to_array(nativeType: LDKTransaction, deallocate: Bool = true) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		if deallocate && nativeType.datalen > 0 {
			nativeType.data.deallocate()
		}
		return array
	}
	/* RUST_TO_SWIFT_END */

    public class func LDKStr_to_string(nativeType: LDKStr) -> String {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.len) {
			let currentEntry = nativeType.chars[index]
			/* CONVERSION_PREP */
			array.append(currentEntry)
		}
		let data = Data(bytes: array)
		let string = String(data: data, encoding: .utf8)!
		return string
	}

    public class func UnsafeIntPointer_to_string(nativeType: UnsafePointer<Int8>) -> String {
		let string = String(cString: nativeType)
		return string
	}

    public class func string_to_unsafe_int8_pointer(string: String) -> UnsafePointer<Int8> {
		let count = string.utf8CString.count
		let result: UnsafeMutableBufferPointer<Int8> = UnsafeMutableBufferPointer<Int8>.allocate(capacity: count)
		_ = result.initialize(from: string.utf8CString)
		let mutablePointer = result.baseAddress!
		return UnsafePointer<Int8>(mutablePointer)
	}

	public class func string_to_unsafe_uint8_pointer(string: String) -> UnsafePointer<UInt8> {
		let stringData = string.data(using: .utf8)
		let dataMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: string.count)
		stringData?.copyBytes(to: dataMutablePointer, count: string.count)

		return UnsafePointer<UInt8>(dataMutablePointer)
	}

	public class func new_LDKStr(string: String) -> LDKStr {
		let nativeType = Self.string_to_unsafe_uint8_pointer(string: string)
		return LDKStr(chars: nativeType, len: UInt(string.count), chars_is_owned: false)
	}

    public class func createInvoiceFromChannelManager(channelManager: ChannelManager, keysManager: KeysInterface, network: LDKCurrency, amountMsat: UInt64?, description: String) -> Result_InvoiceSignOrCreationErrorZ {
		let nativeKeysManager = keysManager.cOpaqueStruct!
		let amount = Option_u64Z(value: amountMsat)
		let nativeAmount = amount.cOpaqueStruct!
		let nativeDescription = Self.new_LDKStr(string: description)
		return withUnsafePointer(to: channelManager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManager>) -> Result_InvoiceSignOrCreationErrorZ in
			let nativeResult = create_invoice_from_channelmanager(pointer, nativeKeysManager, network, nativeAmount, nativeDescription)
			return Result_InvoiceSignOrCreationErrorZ(pointer: nativeResult)
		}
	}

	public class func getRoute(our_node_id: [UInt8], network: NetworkGraph, payee: [UInt8], payee_features: InvoiceFeatures, first_hops: [LDKChannelDetails], last_hops: [LDKRouteHint], final_value_msat: UInt64, final_cltv: UInt32, logger: Logger) -> Result_RouteLightningErrorZ {
		return withUnsafePointer(to: network.cOpaqueStruct!) { (networkPointer: UnsafePointer<LDKNetworkGraph>) in
			var mutableHops = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: first_hops).cOpaqueStruct!
			return withUnsafeMutablePointer(to: &mutableHops) { (first_hopsPointer) in
				Result_RouteLightningErrorZ(pointer: get_route(Bindings.new_LDKPublicKey(array: our_node_id), networkPointer, Bindings.new_LDKPublicKey(array: payee), payee_features.cOpaqueStruct!, first_hopsPointer, Bindings.new_LDKCVec_RouteHintZWrapper(array: last_hops).cOpaqueStruct!, final_value_msat, final_cltv, logger.cOpaqueStruct!))
			}
		}
	}

}

public class InstanceCrashSimulator: NativeTypeWrapper {

    public init() {
		super.init(conflictAvoidingVariableName: 0)
	}

    public func getPointer() -> UnsafeMutableRawPointer {
        let pointer = Bindings.instanceToPointer(instance: self)
        return pointer
    }

}

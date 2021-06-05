//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

public typealias LDKTransactionOutputs = LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
public typealias LDKTxid = LDKThirtyTwoBytes

public class Bindings{

	/* BYTE_ARRAY_METHODS_START */
	public class func new_LDKByteType(array: [UInt8]) -> LDKByteType {
		let byteType = LDKByteType(fieldName: (tupleArguments))
		return byteType
	}

	public class func LDKByteType_to_array(nativeType: LDKByteType) -> [UInt8] {
		let array = [tupleReads]
		return array
	}
	/* BYTE_ARRAY_METHODS_END */

	/* VECTOR_METHODS_START */
	/* SWIFT_TO_RUST_START */
	public class func new_LDKCVec_rust_primitive(array: [SwiftPrimitive]) -> LDKCVec_rust_primitive {
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
        return vector

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
		return array
	}
	/* RUST_TO_SWIFT_END */
	/* VECTOR_METHODS_END */

	public class func instanceToPointer(instance: AnyObject) -> UnsafeMutableRawPointer {
		Unmanaged.passUnretained(instance).toOpaque()
	}

	public class func pointerToInstance<T: AnyObject>(pointer: UnsafeRawPointer) -> T{
		Unmanaged<T>.fromOpaque(pointer).takeUnretainedValue()
	}

	public class func new_LDKu8slice(array: [UInt8]) -> LDKu8slice {
		/*
		let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
			let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
			return mutablePointer
		}
        */

        let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
        dataContainer.initialize(from: array, count: array.count)

		let vector = LDKu8slice(data: dataContainer, datalen: UInt(array.count))
		return vector
	}

	public class func LDKu8slice_to_array(nativeType: LDKu8slice) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			array.append(currentEntry)
		}
		return array
	}

	public class func new_LDKTransaction(array: [UInt8]) -> LDKTransaction {
        /*
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }
        */

        let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
        dataContainer.initialize(from: array, count: array.count)

        let vector = LDKTransaction(data: dataContainer, datalen: UInt(array.count), data_is_owned: false)
        return vector
    }

    public class func LDKTransaction_to_array(nativeType: LDKTransaction) -> [UInt8] {
        var array = [UInt8]()
        for index in 0..<Int(nativeType.datalen) {
            let currentEntry = nativeType.data[index]
            array.append(currentEntry)
        }
        return array
    }

    public class func LDKStr_to_string(nativeType: LDKStr) -> String {
        let string = String(cString: nativeType.chars)
        assert(string.count == nativeType.len)
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

}

public class TxOut {

	public internal(set) var cOpaqueStruct: LDKTxOut?;
	init(pointer: LDKTxOut) {
		self.cOpaqueStruct = pointer
	}

	public func getScriptPubkey() -> [UInt8] {
		return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.script_pubkey)
	}

	public func getValue() -> UInt64 {
		return self.cOpaqueStruct!.value
	}

}

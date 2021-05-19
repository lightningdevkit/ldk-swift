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

        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<SwiftPrimitive>) -> UnsafeMutablePointer<SwiftPrimitive> in
            let mutablePointer = UnsafeMutablePointer<SwiftPrimitive>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

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
		let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
			let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
			return mutablePointer
		}

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
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

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

    public class func new_LDKStr(string: String) -> LDKStr {
        let stringData = string.data(using: .utf8)
        let dataMutablePointer = UnsafeMutablePointer<UInt8>.allocate(capacity: string.count)
        stringData?.copyBytes(to: dataMutablePointer, count: string.count)

        let nativeType = UnsafePointer<UInt8>(dataMutablePointer)

        return LDKStr(chars: nativeType, len: UInt(string.count), chars_is_owned: false)
    }

}

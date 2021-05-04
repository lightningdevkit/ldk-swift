//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

typealias LDKTransactionOutputs = LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ
typealias LDKTxid = LDKThirtyTwoBytes

class Bindings{

	/* BYTE_ARRAY_METHODS_START */
	static func new_LDKByteType(array: [UInt8]) -> LDKByteType {
		let byteType = LDKByteType(fieldName: (tupleArguments))
		return byteType
	}

	static func LDKByteType_to_array(nativeType: LDKByteType) -> [UInt8] {
		let array = [tupleReads]
		return array
	}
	/* BYTE_ARRAY_METHODS_END */

	/* VECTOR_METHODS_START */
	/* SWIFT_TO_RUST_START */
	static func new_LDKCVec_rust_primitive(array: [SwiftPrimitive]) -> LDKCVec_rust_primitive {
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
    static func LDKCVec_rust_primitive_to_array(nativeType: LDKCVec_rust_primitive) -> [SwiftPrimitive] {
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

	static func instanceToPointer(instance: AnyObject) -> UnsafeMutableRawPointer {
		Unmanaged.passUnretained(instance).toOpaque()
	}

	static func pointerToInstance<T: AnyObject>(pointer: UnsafeRawPointer) -> T{
		Unmanaged<T>.fromOpaque(pointer).takeUnretainedValue()
	}

	static func new_LDKu8slice(array: [UInt8]) -> LDKu8slice {
		let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
			let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
			return mutablePointer
		}

		let vector = LDKu8slice(data: dataContainer, datalen: UInt(array.count))
		return vector
	}

	static func LDKu8slice_to_array(nativeType: LDKu8slice) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(nativeType.datalen) {
			let currentEntry = nativeType.data[index]
			array.append(currentEntry)
		}
		return array
	}

	static func new_LDKTransaction(array: [UInt8]) -> LDKTransaction {
        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

        let vector = LDKTransaction(data: dataContainer, datalen: UInt(array.count), data_is_owned: false)
        return vector
    }

    static func LDKTransaction_to_array(nativeType: LDKTransaction) -> [UInt8] {
        var array = [UInt8]()
        for index in 0..<Int(nativeType.datalen) {
            let currentEntry = nativeType.data[index]
            array.append(currentEntry)
        }
        return array
    }

}

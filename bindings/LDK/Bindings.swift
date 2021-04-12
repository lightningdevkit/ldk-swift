//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

class Bindings{

	/* VECTOR_METHODS_START */

	static func new_LDKCVec_CVec_u8ZZ(array: [UInt8]) -> LDKCVec_CVec_u8ZZ {

        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

        let vector = LDKCVec_CVec_u8ZZ(data: dataContainer, datalen: UInt(array.count))
        return vector

    }

    static func LDKCVec_CVec_u8ZZ_to_array(vector: LDKCVec_CVec_u8ZZ) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(vector.datalen) {
			array.append(vector.data[index])
		}
		return array
	}

	static func new_LDKCVec_u8Z(array: [UInt8]) -> LDKCVec_u8Z {

        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt8>) -> UnsafeMutablePointer<UInt8> in
            let mutablePointer = UnsafeMutablePointer<UInt8>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

        let vector = LDKCVec_u8Z(data: dataContainer, datalen: UInt(array.count))
        return vector

    }

    static func LDKCVec_u8Z_to_array(vector: LDKCVec_u8Z) -> [UInt8] {
		var array = [UInt8]()
		for index in 0..<Int(vector.datalen) {
			array.append(vector.data[index])
		}
		return array
	}

	static func new_LDKCVec_u64Z(array: [UInt64]) -> LDKCVec_u64Z {

        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<UInt64>) -> UnsafeMutablePointer<UInt64> in
            let mutablePointer = UnsafeMutablePointer<UInt64>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

        let vector = LDKCVec_u64Z(data: dataContainer, datalen: UInt(array.count))
        return vector

    }

    static func LDKCVec_u64Z_to_array(vector: LDKCVec_u64Z) -> [UInt64] {
		var array = [UInt64]()
		for index in 0..<Int(vector.datalen) {
			array.append(vector.data[index])
		}
		return array
	}

	/* VECTOR_METHODS_END */

}

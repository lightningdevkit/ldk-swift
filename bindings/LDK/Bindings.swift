//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

class Bindings{

	/* BYTE_ARRAY_METHODS_START */

	static func new_LDKSecretKey(array: [UInt8]) -> LDKSecretKey {
		let byteType = LDKSecretKey(bytes: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31]))
		return byteType
	}

	static func LDKSecretKey_to_array(byteType: LDKSecretKey) -> [UInt8] {
		let array = [byteType.bytes.0, byteType.bytes.1, byteType.bytes.2, byteType.bytes.3, byteType.bytes.4, byteType.bytes.5, byteType.bytes.6, byteType.bytes.7, byteType.bytes.8, byteType.bytes.9, byteType.bytes.10, byteType.bytes.11, byteType.bytes.12, byteType.bytes.13, byteType.bytes.14, byteType.bytes.15, byteType.bytes.16, byteType.bytes.17, byteType.bytes.18, byteType.bytes.19, byteType.bytes.20, byteType.bytes.21, byteType.bytes.22, byteType.bytes.23, byteType.bytes.24, byteType.bytes.25, byteType.bytes.26, byteType.bytes.27, byteType.bytes.28, byteType.bytes.29, byteType.bytes.30, byteType.bytes.31]
		return array
	}

	static func new_LDKThirtyTwoBytes(array: [UInt8]) -> LDKThirtyTwoBytes {
		let byteType = LDKThirtyTwoBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31]))
		return byteType
	}

	static func LDKThirtyTwoBytes_to_array(byteType: LDKThirtyTwoBytes) -> [UInt8] {
		let array = [byteType.data.0, byteType.data.1, byteType.data.2, byteType.data.3, byteType.data.4, byteType.data.5, byteType.data.6, byteType.data.7, byteType.data.8, byteType.data.9, byteType.data.10, byteType.data.11, byteType.data.12, byteType.data.13, byteType.data.14, byteType.data.15, byteType.data.16, byteType.data.17, byteType.data.18, byteType.data.19, byteType.data.20, byteType.data.21, byteType.data.22, byteType.data.23, byteType.data.24, byteType.data.25, byteType.data.26, byteType.data.27, byteType.data.28, byteType.data.29, byteType.data.30, byteType.data.31]
		return array
	}

	static func new_LDKTenBytes(array: [UInt8]) -> LDKTenBytes {
		let byteType = LDKTenBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9]))
		return byteType
	}

	static func LDKTenBytes_to_array(byteType: LDKTenBytes) -> [UInt8] {
		let array = [byteType.data.0, byteType.data.1, byteType.data.2, byteType.data.3, byteType.data.4, byteType.data.5, byteType.data.6, byteType.data.7, byteType.data.8, byteType.data.9]
		return array
	}

	static func new_LDKFourBytes(array: [UInt8]) -> LDKFourBytes {
		let byteType = LDKFourBytes(data: (array[0], array[1], array[2], array[3]))
		return byteType
	}

	static func LDKFourBytes_to_array(byteType: LDKFourBytes) -> [UInt8] {
		let array = [byteType.data.0, byteType.data.1, byteType.data.2, byteType.data.3]
		return array
	}

	static func new_LDKPublicKey(array: [UInt8]) -> LDKPublicKey {
		let byteType = LDKPublicKey(compressed_form: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32]))
		return byteType
	}

	static func LDKPublicKey_to_array(byteType: LDKPublicKey) -> [UInt8] {
		let array = [byteType.compressed_form.0, byteType.compressed_form.1, byteType.compressed_form.2, byteType.compressed_form.3, byteType.compressed_form.4, byteType.compressed_form.5, byteType.compressed_form.6, byteType.compressed_form.7, byteType.compressed_form.8, byteType.compressed_form.9, byteType.compressed_form.10, byteType.compressed_form.11, byteType.compressed_form.12, byteType.compressed_form.13, byteType.compressed_form.14, byteType.compressed_form.15, byteType.compressed_form.16, byteType.compressed_form.17, byteType.compressed_form.18, byteType.compressed_form.19, byteType.compressed_form.20, byteType.compressed_form.21, byteType.compressed_form.22, byteType.compressed_form.23, byteType.compressed_form.24, byteType.compressed_form.25, byteType.compressed_form.26, byteType.compressed_form.27, byteType.compressed_form.28, byteType.compressed_form.29, byteType.compressed_form.30, byteType.compressed_form.31, byteType.compressed_form.32]
		return array
	}

	static func new_LDKThreeBytes(array: [UInt8]) -> LDKThreeBytes {
		let byteType = LDKThreeBytes(data: (array[0], array[1], array[2]))
		return byteType
	}

	static func LDKThreeBytes_to_array(byteType: LDKThreeBytes) -> [UInt8] {
		let array = [byteType.data.0, byteType.data.1, byteType.data.2]
		return array
	}

	static func new_LDKSixteenBytes(array: [UInt8]) -> LDKSixteenBytes {
		let byteType = LDKSixteenBytes(data: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15]))
		return byteType
	}

	static func LDKSixteenBytes_to_array(byteType: LDKSixteenBytes) -> [UInt8] {
		let array = [byteType.data.0, byteType.data.1, byteType.data.2, byteType.data.3, byteType.data.4, byteType.data.5, byteType.data.6, byteType.data.7, byteType.data.8, byteType.data.9, byteType.data.10, byteType.data.11, byteType.data.12, byteType.data.13, byteType.data.14, byteType.data.15]
		return array
	}

	static func new_LDKSignature(array: [UInt8]) -> LDKSignature {
		let byteType = LDKSignature(compact_form: (array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9], array[10], array[11], array[12], array[13], array[14], array[15], array[16], array[17], array[18], array[19], array[20], array[21], array[22], array[23], array[24], array[25], array[26], array[27], array[28], array[29], array[30], array[31], array[32], array[33], array[34], array[35], array[36], array[37], array[38], array[39], array[40], array[41], array[42], array[43], array[44], array[45], array[46], array[47], array[48], array[49], array[50], array[51], array[52], array[53], array[54], array[55], array[56], array[57], array[58], array[59], array[60], array[61], array[62], array[63]))
		return byteType
	}

	static func LDKSignature_to_array(byteType: LDKSignature) -> [UInt8] {
		let array = [byteType.compact_form.0, byteType.compact_form.1, byteType.compact_form.2, byteType.compact_form.3, byteType.compact_form.4, byteType.compact_form.5, byteType.compact_form.6, byteType.compact_form.7, byteType.compact_form.8, byteType.compact_form.9, byteType.compact_form.10, byteType.compact_form.11, byteType.compact_form.12, byteType.compact_form.13, byteType.compact_form.14, byteType.compact_form.15, byteType.compact_form.16, byteType.compact_form.17, byteType.compact_form.18, byteType.compact_form.19, byteType.compact_form.20, byteType.compact_form.21, byteType.compact_form.22, byteType.compact_form.23, byteType.compact_form.24, byteType.compact_form.25, byteType.compact_form.26, byteType.compact_form.27, byteType.compact_form.28, byteType.compact_form.29, byteType.compact_form.30, byteType.compact_form.31, byteType.compact_form.32, byteType.compact_form.33, byteType.compact_form.34, byteType.compact_form.35, byteType.compact_form.36, byteType.compact_form.37, byteType.compact_form.38, byteType.compact_form.39, byteType.compact_form.40, byteType.compact_form.41, byteType.compact_form.42, byteType.compact_form.43, byteType.compact_form.44, byteType.compact_form.45, byteType.compact_form.46, byteType.compact_form.47, byteType.compact_form.48, byteType.compact_form.49, byteType.compact_form.50, byteType.compact_form.51, byteType.compact_form.52, byteType.compact_form.53, byteType.compact_form.54, byteType.compact_form.55, byteType.compact_form.56, byteType.compact_form.57, byteType.compact_form.58, byteType.compact_form.59, byteType.compact_form.60, byteType.compact_form.61, byteType.compact_form.62, byteType.compact_form.63]
		return array
	}

	/* BYTE_ARRAY_METHODS_END */

	/* VECTOR_METHODS_START */

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

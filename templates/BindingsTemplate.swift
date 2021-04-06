//
//  Bindings.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 3/23/21.
//

import Foundation

class Bindings{

	/* VECTOR_METHODS_START */
	static func new_LDKCVec_rust_primitive(array: [SwiftPrimitive]) -> LDKCVec_rust_primitive {

        let dataContainer = array.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<SwiftPrimitive>) -> UnsafeMutablePointer<SwiftPrimitive> in
            let mutablePointer = UnsafeMutablePointer<SwiftPrimitive>(mutating: pointer.baseAddress!)
            return mutablePointer
        }

        let vector = LDKCVec_rust_primitive(data: dataContainer, datalen: UInt(array.count))
        return vector

    }

    static func LDKCVec_rust_primitive_to_array(vector: LDKCVec_rust_primitive) -> [SwiftPrimitive] {
		var array = [SwiftPrimitive]()
		for index in 0..<Int(vector.datalen) {
			array.append(vector.data[index])
		}
		return array
	}
	/* VECTOR_METHODS_END */

}

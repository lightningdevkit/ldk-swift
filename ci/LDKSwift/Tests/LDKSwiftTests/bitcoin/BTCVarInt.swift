//
//  BTCVarInt.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 3/29/22.
//

#if os(Linux)
import LDKSwift
import LDKHeaders
#endif

public class BTCVarInt {
    
    private let value: UInt64
    
    public init(_ value: UInt64) {
        self.value = value
    }
    
    public func serialize() -> [UInt8] {
        var varInt = [UInt8]()
        var valueBytes: [UInt8]
        
        if self.value < 0xfd {
            return [UInt8(self.value)]
        } else if self.value <= 0xffff {
            varInt.append(0xfd)
            valueBytes = withUnsafeBytes(of: UInt16(self.value).littleEndian) { bytes in
                Array(bytes)
            }
        } else if self.value <= 0xffffffff {
            varInt.append(0xfe)
            valueBytes = withUnsafeBytes(of: UInt32(self.value).littleEndian) { bytes in
                Array(bytes)
            }
        } else {
            varInt.append(0xff)
            valueBytes = withUnsafeBytes(of: self.value.littleEndian) { bytes in
                Array(bytes)
            }
        }
        varInt.append(contentsOf: valueBytes)
        return varInt
    }
    
}

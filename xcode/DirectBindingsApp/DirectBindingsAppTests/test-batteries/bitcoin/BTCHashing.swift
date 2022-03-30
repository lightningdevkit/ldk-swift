//
//  BTCHashing.swift
//  DirectBindingsAppTests
//
//  Created by Arik Sosman on 3/29/22.
//

import Foundation
import CommonCrypto

class BTCHashing {
    
    public static let SHA_ZERO_HASH = [UInt8](repeating: 0, count: 32)
    public static let RIPEMD_ZERO_HASH = [UInt8](repeating: 0, count: 20)
    
    private static func sha256(_ input: [UInt8]) -> [UInt8] {
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        input.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(input.count), &hash)
        }
        assert(hash.count == 32)
        return hash
    }
    
    static func doubleSha256(_ input: [UInt8]) -> [UInt8] {
        return sha256(sha256(input))
    }
    
}

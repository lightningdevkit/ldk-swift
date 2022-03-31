//
//  BitcoinTests.swift
//  DirectBindingsAppTests
//
//  Created by Arik Sosman on 3/29/22.
//

import XCTest
import LDKSwift
import LDKHeaders

public class BitcoinTests: XCTestCase {
    
    func testVarInt() throws {
        do {
            let varInt = BTCVarInt(0xfc)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfc])
        }
        
        do {
            let varInt = BTCVarInt(0xfd)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfd, 0xfd, 0])
        }
        
        do {
            let varInt = BTCVarInt(0xfe)
            let serialization = varInt.serialize()
            XCTAssertEqual(serialization, [0xfd, 0xfe, 0])
        }
    }
    
    func testBlockHashing() throws {
        let block = BTCBlock()
        block.version = 1
        block.previousBlockHash = [129, 205, 2, 171, 126, 86, 158, 139, 205, 147, 23, 226, 254, 153, 242, 222, 68, 212, 154, 178, 184, 133, 27, 164, 163, 8, 0, 0, 0, 0, 0, 0]
        block.merkleRoot = [227, 32, 182, 194, 255, 252, 141, 117, 4, 35, 219, 139, 30, 185, 66, 174, 113, 14, 149, 30, 215, 151, 247, 175, 252, 136, 146, 176, 241, 252, 18, 43]
        block.timestamp = 1305998791
        block.difficultyTarget = 440711666
        block.nonce = 2504433986
        let hash = block.calculateHash();
        
        for i in 1...8 {
            // verify that the hash worked correctly with enough trailing 0s
            XCTAssertEqual(hash[hash.count - i], 0)
        }
        
        // sanity check that the hash is not all 0s
        XCTAssertNotEqual(hash[hash.count - 9], 0)
        
        // verify that the leading byte is nonzero
        XCTAssertNotEqual(hash[0], 0)
    }
    
    func testBlockSerialization() throws {
        let block = BTCBlock()
        block.version = 2
        block.previousBlockHash = BTCHashing.SHA_ZERO_HASH
        block.merkleRoot = BTCHashing.SHA_ZERO_HASH
        block.timestamp = 42
        block.difficultyTarget = 0
        block.nonce = 0
        
        let serialization = block.serialize()
        XCTAssertEqual(serialization, [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    }
    
    func testTxSerialization() throws {
        let tx = BTCTransaction()
        tx.version = 1
        let input = BTCTransaction.Input(
            previousTransactionHash: BTCHashing.SHA_ZERO_HASH,
            previousOutputIndex: 0xffffffff, // coinbase transaction has a u32::MAX prev output index 
            script: []
        )
        tx.inputs = [input]
        tx.setWitnessForInput(inputIndex: 0, witness: BTCTransaction.Witness(stackElements: [[1]]))
        
        let output = BTCTransaction.Output(value: 100000, script: [0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14])
        tx.outputs = [output]
        let txSerialization = tx.serialize()
        XCTAssertEqual(txSerialization.count, 99)
        XCTAssertEqual(txSerialization, [1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 1, 160, 134, 1, 0, 0, 0, 0, 0, 34, 0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14, 1, 1, 1, 0, 0, 0, 0])
        
        let block = BTCBlock()
        block.version = 2
        block.previousBlockHash = BTCHashing.SHA_ZERO_HASH
        block.merkleRoot = BTCHashing.SHA_ZERO_HASH
        block.timestamp = 42
        block.difficultyTarget = 0
        block.nonce = 0
        block.transactions = [tx]
        let blockSerialization = block.serialize()
        XCTAssertEqual(blockSerialization, [2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 1, 160, 134, 1, 0, 0, 0, 0, 0, 34, 0, 32, 214, 232, 96, 182, 226, 231, 42, 33, 219, 246, 121, 242, 58, 123, 110, 124, 118, 63, 70, 117, 109, 247, 0, 58, 172, 198, 127, 254, 216, 194, 41, 14, 1, 1, 1, 0, 0, 0, 0])
    }
    
}

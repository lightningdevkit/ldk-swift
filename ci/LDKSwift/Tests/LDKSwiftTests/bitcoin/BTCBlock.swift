//
//  BTCBlock.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 3/28/22.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif
import XCTest

/// serialization:
/// 4 bytes: 0xD9B4BEF9
/// 4 bytes: block size (remaining byte count)
/// 80 bytes: block header
/// VarInt (1-9 bytes): transaction count
/// transactions

class BTCBlock: Equatable {
    
    var version: UInt32 = 2
    var previousBlockHash: [UInt8] = []
    var merkleRoot: [UInt8]?
    var timestamp: UInt32 = 0
    var difficultyTarget: UInt32 = 0
    var nonce: UInt32 = 0
    
    // each transaction is a uint8 array
    var transactions: [BTCTransaction] = []
    
    func calculateMerkleRoot() -> [UInt8] {
        // TODO: merkleize the transactions
        if let merkleRoot = self.merkleRoot {
            return merkleRoot
        }
        return [UInt8](repeating: 0, count: 32)
    }
    
    func calculateHeader() -> [UInt8] {
        var header = [UInt8]()
        
        do {
            let versionBytes = withUnsafeBytes(of: self.version.littleEndian) { bytes in
                Array(bytes)
            }
            assert(versionBytes.count == 4)
            header.append(contentsOf: versionBytes)
        }
        
        do {
            assert(self.previousBlockHash.count == 32)
            header.append(contentsOf: self.previousBlockHash)
        }
        
        do {
            let merkleRoot = self.calculateMerkleRoot()
            assert(merkleRoot.count == 32)
            header.append(contentsOf: merkleRoot)
        }
        
        do {
            let timestampBytes = withUnsafeBytes(of: self.timestamp.littleEndian) { bytes in
                Array(bytes)
            }
            assert(timestampBytes.count == 4)
            header.append(contentsOf: timestampBytes)
        }
        
        do{
            let difficultyTargetBytes = withUnsafeBytes(of: self.difficultyTarget.littleEndian) { bytes in
                Array(bytes)
            }
            assert(difficultyTargetBytes.count == 4)
            header.append(contentsOf: difficultyTargetBytes)
        }
        
        do {
            let nonceBytes = withUnsafeBytes(of: self.nonce.littleEndian) { bytes in
                Array(bytes)
            }
            assert(nonceBytes.count == 4)
            header.append(contentsOf: nonceBytes)
        }
        
        assert(header.count == 80)
        return header
    }
    
    /// The double sha256 hash of the block header (note: not the entire block)
    /// In a well-mined block, the zeroes should be trailing, as this hash is little-endian-equivalent
    func calculateHash() -> [UInt8] {
        let blockHeader = self.calculateHeader()
        return BTCHashing.doubleSha256(blockHeader)
    }
    
    func serialize() -> [UInt8] {
        
        var block = [UInt8]()
        
        // apparently, this only needs to be appended when it's actually part of a block
        /*
        do {
            let magicNumber: UInt32 = 4190024921
            let magicNumberBytes = withUnsafeBytes(of: magicNumber.littleEndian) { bytes in
                Array(bytes)
            }
            assert(magicNumberBytes.count == 4)
            assert(magicNumberBytes == [0xf9, 0xbe, 0xb4, 0xd9])
            
            block.append(contentsOf: magicNumberBytes)
        }
        */
        
        let blockHeader = self.calculateHeader()
        let transactionCounter = BTCVarInt(UInt64(self.transactions.count)).serialize()
        let transactionData = self.transactions.reduce(into: [UInt8]()) { partialResult, currentValue in
            return partialResult.append(contentsOf: currentValue.serialize())
        }
        
        /*
        do {
            let blockSize = blockHeader.count + transactionCounter.count + transactionData.count
            let blockSizeBytes = withUnsafeBytes(of: UInt32(blockSize).littleEndian) { bytes in
                Array(bytes)
            }
            assert(blockSizeBytes.count == 4)
            block.append(contentsOf: blockSizeBytes)
        }
        */
        
        block.append(contentsOf: blockHeader)
        block.append(contentsOf: transactionCounter)
        block.append(contentsOf: transactionData)
        
        return block
    }
    
    static func == (lhs: BTCBlock, rhs: BTCBlock) -> Bool {
        return lhs.calculateHash() == rhs.calculateHash()
    }
    
}

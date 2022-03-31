//
//  BTCTransaction.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 3/29/22.
//

import LDKSwift
import LDKHeaders

class BTCTransaction: Equatable {
    
    var version: UInt32 = 1
    var flag: UInt16? // let's not support witness data quite yet
    var inputs: [Input] = []
    var outputs: [Output] = []
    var lockTime: UInt32 = 0
    
    public func serialize(useSegwit: Bool = true) -> [UInt8] {
        var transaction = [UInt8]()
        
        var witnessData = [UInt8]()
        
        do {
            let versionBytes = withUnsafeBytes(of: self.version.littleEndian) { bytes in
                Array(bytes)
            }
            assert(versionBytes.count == 4)
            transaction.append(contentsOf: versionBytes)
        }
        
        if let flag = self.flag, useSegwit {
            let flagBytes = withUnsafeBytes(of: flag.littleEndian) { bytes in
                Array(bytes)
            }
            assert(flagBytes.count == 2)
            transaction.append(contentsOf: flagBytes)
        }
        
        do {
            let inputCounter = BTCVarInt(UInt64(self.inputs.count)).serialize()
            transaction.append(contentsOf: inputCounter)
            
            self.inputs.map { currentInput in
                transaction.append(contentsOf: currentInput.serialize())
                if let witness = currentInput.witness, useSegwit {
                    witnessData.append(contentsOf: witness.serialize())
                } else if let _ = self.flag, useSegwit {
                    witnessData.append(0) // empty witness for this particular input
                }
            }
        }
        
        do {
            let outputCounter = BTCVarInt(UInt64(self.outputs.count)).serialize()
            transaction.append(contentsOf: outputCounter)
            
            self.outputs.map { currentOutput in
                transaction.append(contentsOf: currentOutput.serialize())
            }
        }
        
        transaction.append(contentsOf: witnessData)
        
        do {
            let lockTimeBytes = withUnsafeBytes(of: self.lockTime.littleEndian) { bytes in
                Array(bytes)
            }
            assert(lockTimeBytes.count == 4)
            transaction.append(contentsOf: lockTimeBytes)
        }
        
        return transaction
    }
    
    public func setWitnessForInput(inputIndex: Int, witness: Witness) {
        self.flag = 256
        self.inputs[inputIndex].witness = witness
    }
    
    public func calculateId() -> [UInt8] {
        let transactionData = self.serialize(useSegwit: false)
        return BTCHashing.doubleSha256(transactionData)
    }
    
    public func calculateHash() -> [UInt8] {
        let transactionData = self.serialize()
        return BTCHashing.doubleSha256(transactionData)
    }
    
    static func == (lhs: BTCTransaction, rhs: BTCTransaction) -> Bool {
        return lhs.calculateHash() == rhs.calculateHash()
    }
    
    public class Input {
        var previousTransactionHash: [UInt8]
        var previousOutputIndex: UInt32
        var script: [UInt8]
        var sequence: UInt32 = 0xffffffff
        fileprivate var witness: Witness?
        
        init(previousTransactionHash: [UInt8], previousOutputIndex: UInt32, script: [UInt8]) {
            self.previousTransactionHash = previousTransactionHash
            self.previousOutputIndex = previousOutputIndex
            self.script = script
        }
        
        fileprivate func serialize() -> [UInt8] {
            var input = [UInt8]()
            
            input.append(contentsOf: previousTransactionHash)
            
            do {
                let outputIndexBytes = withUnsafeBytes(of: self.previousOutputIndex.littleEndian) { bytes in
                    Array(bytes)
                }
                assert(outputIndexBytes.count == 4)
                input.append(contentsOf: outputIndexBytes)
            }
            
            do {
                let scriptLengthCounter = BTCVarInt(UInt64(self.script.count)).serialize()
                input.append(contentsOf: scriptLengthCounter)
                input.append(contentsOf: self.script)
            }
            
            do {
                let sequenceBytes = withUnsafeBytes(of: self.sequence.littleEndian) { bytes in
                    Array(bytes)
                }
                assert(sequenceBytes.count == 4)
                input.append(contentsOf: sequenceBytes)
            }
            
            return input
        }
    }
    
    public struct Witness {
        var stackElements: [[UInt8]]
        
        fileprivate func serialize() -> [UInt8] {
            var witness = [UInt8]()
            
            let stackSizeCounter = BTCVarInt(UInt64(self.stackElements.count)).serialize()
            witness.append(contentsOf: stackSizeCounter)
            
            self.stackElements.map { currentElement in
                let elementSizeCounter = BTCVarInt(UInt64(currentElement.count)).serialize()
                witness.append(contentsOf: elementSizeCounter)
                witness.append(contentsOf: currentElement)
            }
            
            return witness
        }
        
    }
    
    public struct Output {
        var value: UInt64
        var script: [UInt8]
        
        fileprivate func serialize() -> [UInt8] {
            var output = [UInt8]()
            
            do {
                let valueBytes = withUnsafeBytes(of: self.value.littleEndian) { bytes in
                    Array(bytes)
                }
                assert(valueBytes.count == 8)
                output.append(contentsOf: valueBytes)
            }
            
            do {
                let scriptLengthCounter = BTCVarInt(UInt64(self.script.count)).serialize()
                output.append(contentsOf: scriptLengthCounter)
                output.append(contentsOf: self.script)
            }
            
            return output
        }
    }
    
}

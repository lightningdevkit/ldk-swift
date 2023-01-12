//
//  MyFilter.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestFilter: Filter {
    
    override func registerTx(txid: [UInt8]?, scriptPubkey: [UInt8]) {
        // watch this transaction on-chain
    }
    
    override func registerOutput(output: Bindings.WatchedOutput) {
        let scriptPubkeyBytes = output.getScriptPubkey()
        let outpoint = output.getOutpoint()
        let txid = outpoint.getTxid()
        let outputIndex = outpoint.getIndex()
        
        // watch for any transactions that spend this output on-chain
        
        let blockHashBytes = output.getBlockHash()
        // if block hash bytes are not null, return any transaction spending the output that is found in the corresponding block along with its index
    }
}

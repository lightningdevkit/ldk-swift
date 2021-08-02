//
//  MyBroadcasterInterface.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

import LDKSwift
import LDKHeaders

class TestBroadcasterInterface: BroadcasterInterface {
    
    override func broadcast_transaction(tx: [UInt8]) {
        // insert code to broadcast transaction
    }
    
    func testthis(km: KeysManager){
        var result = km.spend_spendable_outputs(descriptors: [], outputs: [], change_destination_script: [], feerate_sat_per_1000_weight: 0)
        // result.
        result.cOpaqueStruct
        
    }
    
}

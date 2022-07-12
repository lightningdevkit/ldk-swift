//
//  MyBroadcasterInterface.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestBroadcasterInterface: BroadcasterInterface {
    
    override func broadcast_transaction(tx: [UInt8]) {
        // insert code to broadcast transaction
    }
    
}

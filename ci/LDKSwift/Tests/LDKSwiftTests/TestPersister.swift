//
//  MyPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

import LDKSwift
import LDKHeaders

class TestPersister: Persist {
    
    override func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
        let idBytes: [UInt8] = id.write()
        let monitorBytes: [UInt8] = data.write()
        return Result_NoneChannelMonitorUpdateErrZ.ok()
    }
    
    override func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
        let idBytes: [UInt8] = id.write()
        let monitorBytes: [UInt8] = data.write()
        return Result_NoneChannelMonitorUpdateErrZ.ok()
    }
    
}

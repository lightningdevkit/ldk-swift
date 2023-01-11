//
//  MyPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/17/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestPersister: Persist {

    override func persistNewChannel(channelId: Bindings.OutPoint, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
        .Completed
    }
    
    override func updatePersistedChannel(channelId: Bindings.OutPoint, update: Bindings.ChannelMonitorUpdate, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
        .Completed
    }

}

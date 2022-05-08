//
//  MyChannelManagerPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/27/21.
//

import LDKSwift
import LDKHeaders

class TestChannelManagerPersister : Persister, ExtendedChannelManagerPersister {

    func handle_event(event: Event) {
        // privateHandleEvent(event: event)
    }

    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        return Result_NoneErrorZ()
    }
}

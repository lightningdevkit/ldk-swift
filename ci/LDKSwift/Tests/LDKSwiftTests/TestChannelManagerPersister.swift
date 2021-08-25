//
//  MyChannelManagerPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/27/21.
//

import LDKSwift
import LDKHeaders

class TestChannelManagerPersister : ChannelManagerPersister, ExtendedChannelManagerPersister {

    private let channelManager: ChannelManager?
    private let keysManager: KeysManager? = nil

    init(channelManager: ChannelManager?) {
        self.channelManager = channelManager
        super.init()
    }

    func handle_event(event: Event) {
        // privateHandleEvent(event: event)
    }

    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        return Result_NoneErrorZ()
    }
}

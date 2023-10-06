//
//  MyChannelManagerPersister.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/27/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif

class TestChannelManagerPersister : Persister, ExtendedChannelManagerPersister {

	private let channelManager: ChannelManager?

	init(channelManager: ChannelManager? = nil) {
		self.channelManager = channelManager
		super.init()
	}

    func handleEvent(event: Event) {
        // privateHandleEvent(event: event)
    }
    
    override func persistScorer(scorer: Bindings.WriteableScore) -> Bindings.Result_NoneIOErrorZ {
        .initWithOk()
    }
    
    override func persistGraph(networkGraph: Bindings.NetworkGraph) -> Bindings.Result_NoneIOErrorZ {
        .initWithOk()
    }
    
    override func persistManager(channelManager: Bindings.ChannelManager) -> Bindings.Result_NoneIOErrorZ {
        .initWithOk()
    }
}

class FloatingChannelManagerPersister : Persister{

	private let channelManager: ChannelManager?

	init(channelManager: ChannelManager? = nil) {
		self.channelManager = channelManager
		super.init()
	}
	/*
    func handle_event(event: Event) {
        // privateHandleEvent(event: event)
    }

    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        return Result_NoneErrorZ()
    }
    */
}

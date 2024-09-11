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

	override func persistNewChannel(channelFundingOutpoint: Bindings.OutPoint, monitor: Bindings.ChannelMonitor)
		-> Bindings.ChannelMonitorUpdateStatus
	{
		.Completed
	}

	override func updatePersistedChannel(
		channelFundingOutpoint: Bindings.OutPoint, monitorUpdate: Bindings.ChannelMonitorUpdate,
		monitor: Bindings.ChannelMonitor
	) -> Bindings.ChannelMonitorUpdateStatus {
		.Completed
	}

}

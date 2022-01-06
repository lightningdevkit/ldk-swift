```swift
/* DEFAULT_CONSTRUCTOR_START */
#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(persister: ChannelManagerPersister, event_handler: EventHandler, chain_monitor: ChainMonitor, channel_manager: ChannelManager, net_graph_msg_handler: NetGraphMsgHandler?, peer_manager: PeerManager, logger: Logger) {
	Self.instanceCounter += 1
	self.instanceNumber = Self.instanceCounter
	
	let graphMessageHandler = net_graph_msg_handler?.dangle().cOpaqueStruct! ?? LDKNetGraphMsgHandler(inner: nil, is_owned: true)
	
	self.cOpaqueStruct = withUnsafePointer(to: chain_monitor.cOpaqueStruct!) { (chain_monitorPointer: UnsafePointer<LDKChainMonitor>) in
		withUnsafePointer(to: channel_manager.cOpaqueStruct!) { (channel_managerPointer: UnsafePointer<LDKChannelManager>) in
			withUnsafePointer(to: peer_manager.cOpaqueStruct!) { (peer_managerPointer: UnsafePointer<LDKPeerManager>) in
				BackgroundProcessor_start(persister.cOpaqueStruct!, event_handler.cOpaqueStruct!, chain_monitorPointer, channel_managerPointer, graphMessageHandler, peer_managerPointer, logger.cOpaqueStruct!)
			}
		}
	}
	super.init(conflictAvoidingVariableName: 0)
}
```

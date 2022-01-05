public class BackgroundProcessor: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKBackgroundProcessor?


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
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKBackgroundProcessor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKBackgroundProcessor, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func join() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: BackgroundProcessor_join(self.cOpaqueStruct!));
    }

    public func stop() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: BackgroundProcessor_stop(self.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return BackgroundProcessor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> BackgroundProcessor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing BackgroundProcessor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BackgroundProcessor \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

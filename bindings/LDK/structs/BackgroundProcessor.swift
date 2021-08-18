import LDKHeaders

public class BackgroundProcessor {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKBackgroundProcessor?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(persister: ChannelManagerPersister, event_handler: EventHandler, chain_monitor: ChainMonitor, channel_manager: ChannelManager, peer_manager: PeerManager, logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: chain_monitor.cOpaqueStruct!) { (chain_monitorPointer: UnsafePointer<LDKChainMonitor>) in
withUnsafePointer(to: channel_manager.cOpaqueStruct!) { (channel_managerPointer: UnsafePointer<LDKChannelManager>) in
withUnsafePointer(to: peer_manager.cOpaqueStruct!) { (peer_managerPointer: UnsafePointer<LDKPeerManager>) in
BackgroundProcessor_start(persister.cOpaqueStruct!, event_handler.cOpaqueStruct!, chain_monitorPointer, channel_managerPointer, peer_managerPointer, logger.cOpaqueStruct!)
}
}
}
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKBackgroundProcessor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

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
							print("Freeing BackgroundProcessor \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing BackgroundProcessor \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

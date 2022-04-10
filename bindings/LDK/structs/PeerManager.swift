public class PeerManager: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPeerManager?


	/* DEFAULT_CONSTRUCTOR_START */
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(message_handler: MessageHandler, our_node_secret: [UInt8], ephemeral_random_data: [UInt8], logger: Logger, custom_message_handler: CustomMessageHandler) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: ephemeral_random_data)) { (ephemeral_random_dataPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
PeerManager_new(message_handler.cOpaqueStruct!, Bindings.new_LDKSecretKey(array: our_node_secret), ephemeral_random_dataPointer, logger.cOpaqueStruct!, custom_message_handler.cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
        try? self.addAnchor(anchor: message_handler)
try? self.addAnchor(anchor: logger)
try? self.addAnchor(anchor: custom_message_handler)

    }
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKPeerManager){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKPeerManager, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_peer_node_ids() -> [[UInt8]] {
    	
        return Bindings.LDKCVec_PublicKeyZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_get_peer_node_ids(this_argPointer)
});
    }

    public func new_outbound_connection(their_node_id: [UInt8], descriptor: SocketDescriptor, remote_network_address: Option_NetAddressZ) -> Result_CVec_u8ZPeerHandleErrorZ {
    	
        return Result_CVec_u8ZPeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_new_outbound_connection(this_argPointer, Bindings.new_LDKPublicKey(array: their_node_id), descriptor.danglingClone().cOpaqueStruct!, remote_network_address.danglingClone().cOpaqueStruct!)
});
    }

    public func new_inbound_connection(descriptor: SocketDescriptor, remote_network_address: Option_NetAddressZ) -> Result_NonePeerHandleErrorZ {
    	
        return Result_NonePeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_new_inbound_connection(this_argPointer, descriptor.danglingClone().cOpaqueStruct!, remote_network_address.danglingClone().cOpaqueStruct!)
});
    }

    public func write_buffer_space_avail(descriptor: SocketDescriptor) -> Result_NonePeerHandleErrorZ {
    	
							let descriptorPointer = UnsafeMutablePointer<LDKSocketDescriptor>.allocate(capacity: 1)
							descriptorPointer.initialize(to: descriptor.cOpaqueStruct!)
						
        return Result_NonePeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_write_buffer_space_avail(this_argPointer, descriptorPointer)
});
    }

    public func read_event(peer_descriptor: SocketDescriptor, data: [UInt8]) -> Result_boolPeerHandleErrorZ {
    	
							let peer_descriptorPointer = UnsafeMutablePointer<LDKSocketDescriptor>.allocate(capacity: 1)
							peer_descriptorPointer.initialize(to: peer_descriptor.cOpaqueStruct!)
						
						let dataWrapper = Bindings.new_LDKu8sliceWrapper(array: data)
						defer {
							dataWrapper.noOpRetain()
						}
					
        return Result_boolPeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_read_event(this_argPointer, peer_descriptorPointer, dataWrapper.cOpaqueStruct!)
});
    }

    public func process_events() -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_process_events(this_argPointer)
};
    }

    public func socket_disconnected(descriptor: SocketDescriptor) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
withUnsafePointer(to: descriptor.cOpaqueStruct!) { (descriptorPointer: UnsafePointer<LDKSocketDescriptor>) in
PeerManager_socket_disconnected(this_argPointer, descriptorPointer)
}
};
    }

    public func disconnect_by_node_id(node_id: [UInt8], no_connection_possible: Bool) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_disconnect_by_node_id(this_argPointer, Bindings.new_LDKPublicKey(array: node_id), no_connection_possible)
};
    }

    public func disconnect_all_peers() -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_disconnect_all_peers(this_argPointer)
};
    }

    public func timer_tick_occurred() -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_timer_tick_occurred(this_argPointer)
};
    }

    internal func free() -> Void {
    	
        return PeerManager_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PeerManager {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PeerManager \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PeerManager \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

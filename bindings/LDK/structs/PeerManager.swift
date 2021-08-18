public class PeerManager {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPeerManager?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(message_handler: MessageHandler, our_node_secret: [UInt8], ephemeral_random_data: [UInt8], logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: ephemeral_random_data)) { (ephemeral_random_dataPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
PeerManager_new(message_handler.cOpaqueStruct!, Bindings.new_LDKSecretKey(array: our_node_secret), ephemeral_random_dataPointer, logger.cOpaqueStruct!)
}
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPeerManager){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_peer_node_ids() -> [[UInt8]] {
    	
        return Bindings.LDKCVec_PublicKeyZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_get_peer_node_ids(this_argPointer)
});
    }

    public func new_outbound_connection(their_node_id: [UInt8], descriptor: SocketDescriptor) -> Result_CVec_u8ZPeerHandleErrorZ {
    	
        return Result_CVec_u8ZPeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_new_outbound_connection(this_argPointer, Bindings.new_LDKPublicKey(array: their_node_id), descriptor.danglingClone().cOpaqueStruct!)
});
    }

    public func new_inbound_connection(descriptor: SocketDescriptor) -> Result_NonePeerHandleErrorZ {
    	
        return Result_NonePeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_new_inbound_connection(this_argPointer, descriptor.danglingClone().cOpaqueStruct!)
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
						
        return Result_boolPeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPeerManager>) in
PeerManager_read_event(this_argPointer, peer_descriptorPointer, Bindings.new_LDKu8slice(array: data))
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
							print("Freeing PeerManager \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing PeerManager \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

public class NetworkGraph {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKNetworkGraph?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(genesis_hash: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NetworkGraph_new(Bindings.new_LDKThirtyTwoBytes(array: genesis_hash))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNetworkGraph){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> NetworkGraph {
    	
        return NetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_clone(origPointer)
});
    }

					internal func danglingClone() -> NetworkGraph {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: NetworkGraph_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func update_node_from_announcement(msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in
NetworkGraph_update_node_from_announcement(this_argPointer, msgPointer)
});
    }

    public func update_node_from_unsigned_announcement(msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
NetworkGraph_update_node_from_unsigned_announcement(this_argPointer, msgPointer)
});
    }

    public func update_channel_from_announcement(msg: ChannelAnnouncement, chain_access: Access?) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
							var chain_accessPointer: UnsafeMutablePointer<LDKAccess>? = nil
							if let chain_accessUnwrapped = chain_access {
								chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
								chain_accessPointer!.initialize(to: chain_accessUnwrapped.cOpaqueStruct!)
							}
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
NetworkGraph_update_channel_from_announcement(this_argPointer, msgPointer, chain_accessPointer)
});
    }

    public func update_channel_from_unsigned_announcement(msg: UnsignedChannelAnnouncement, chain_access: Access?) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
							var chain_accessPointer: UnsafeMutablePointer<LDKAccess>? = nil
							if let chain_accessUnwrapped = chain_access {
								chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
								chain_accessPointer!.initialize(to: chain_accessUnwrapped.cOpaqueStruct!)
							}
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
NetworkGraph_update_channel_from_unsigned_announcement(this_argPointer, msgPointer, chain_accessPointer)
});
    }

    public func close_channel_from_update(short_channel_id: UInt64, is_permanent: Bool) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return NetworkGraph_close_channel_from_update(this_argPointer, short_channel_id, is_permanent);
    }

    public func update_channel(msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
NetworkGraph_update_channel(this_argPointer, msgPointer)
});
    }

    public func update_channel_unsigned(msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetworkGraph>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
NetworkGraph_update_channel_unsigned(this_argPointer, msgPointer)
});
    }

    internal func free() -> Void {
    	
        return NetworkGraph_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NetworkGraph {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing NetworkGraph \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing NetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

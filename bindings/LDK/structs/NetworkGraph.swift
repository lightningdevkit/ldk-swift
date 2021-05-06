public class NetworkGraph {

    var cOpaqueStruct: LDKNetworkGraph?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(genesis_hash: [UInt8]) {
    	
		let converted_genesis_hash = Bindings.new_LDKThirtyTwoBytes(array: genesis_hash)
        self.cOpaqueStruct = NetworkGraph_new(converted_genesis_hash)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: NetworkGraph) -> NetworkGraph {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph(pointer: NetworkGraph_clone(origPointer));
    }

    public func write(obj: NetworkGraph) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: NetworkGraph_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: NetworkGraph_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func update_node_from_announcement(this_arg: NetworkGraph, msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_node_from_announcement(this_argPointer, msgPointer));
    }

    public func update_node_from_unsigned_announcement(this_arg: NetworkGraph, msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_node_from_unsigned_announcement(this_argPointer, msgPointer));
    }

    public func update_channel_from_announcement(this_arg: NetworkGraph, msg: ChannelAnnouncement, chain_access: Access) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
						
		let chain_accessPointer = withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAccess>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_channel_from_announcement(this_argPointer, msgPointer, chain_accessPointer));
    }

    public func update_channel_from_unsigned_announcement(this_arg: NetworkGraph, msg: UnsignedChannelAnnouncement, chain_access: Access) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
						
		let chain_accessPointer = withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAccess>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_channel_from_unsigned_announcement(this_argPointer, msgPointer, chain_accessPointer));
    }

    public func close_channel_from_update(this_arg: NetworkGraph, short_channel_id: UInt64, is_permanent: Bool) -> Void {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph_close_channel_from_update(this_argPointer, short_channel_id, is_permanent);
    }

    public func update_channel(this_arg: NetworkGraph, msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_channel(this_argPointer, msgPointer));
    }

    public func update_channel_unsigned(this_arg: NetworkGraph, msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return Result_NoneLightningErrorZ(pointer: NetworkGraph_update_channel_unsigned(this_argPointer, msgPointer));
    }

				
	deinit {
					
					
		NetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

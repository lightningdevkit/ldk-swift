class NetworkGraph {

    var cOpaqueStruct: LDKNetworkGraph?;

    init(genesis_hash: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = NetworkGraph_new(genesis_hash)
    }

    private init(pointer: LDKNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: NetworkGraph) -> NetworkGraph {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph(pointer: NetworkGraph_clone(origPointer));
    }

    func write(obj: NetworkGraph) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph_write(objPointer);
    }

    func read(ser: [U]) -> Result_NetworkGraphDecodeErrorZ {
    	
        return NetworkGraph_read(ser);
    }

    func update_node_from_announcement(&this_arg: NetworkGraph, msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_node_from_announcement(this_argPointer, msgPointer);
    }

    func update_node_from_unsigned_announcement(&this_arg: NetworkGraph, msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_node_from_unsigned_announcement(this_argPointer, msgPointer);
    }

    func update_channel_from_announcement(&this_arg: NetworkGraph, msg: ChannelAnnouncement, &chain_access: Access) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
						
		let chain_accessPointer = withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAccess>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_channel_from_announcement(this_argPointer, msgPointer, chain_accessPointer);
    }

    func update_channel_from_unsigned_announcement(&this_arg: NetworkGraph, msg: UnsignedChannelAnnouncement, &chain_access: Access) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
						
		let chain_accessPointer = withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAccess>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_channel_from_unsigned_announcement(this_argPointer, msgPointer, chain_accessPointer);
    }

    func close_channel_from_update(&this_arg: NetworkGraph, short_channel_id: U, is_permanent: boolean) -> Void {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph_close_channel_from_update(this_argPointer, short_channel_id, is_permanent);
    }

    func update_channel(&this_arg: NetworkGraph, msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_channel(this_argPointer, msgPointer);
    }

    func update_channel_unsigned(&this_arg: NetworkGraph, msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
    	
						
		let this_argPointer = withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNetworkGraph>) in
							
			pointer
						
		}
					
						
		let msgPointer = withUnsafePointer(to: msg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return NetworkGraph_update_channel_unsigned(this_argPointer, msgPointer);
    }

				
	deinit {
					
					
		NetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

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
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph(pointer: NetworkGraph_clone(origPointer))
};
    }

    public func write(obj: NetworkGraph) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_NetworkGraphDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NetworkGraphDecodeErrorZ(pointer: NetworkGraph_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func update_node_from_announcement(this_arg: NetworkGraph, msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in
NetworkGraph_update_node_from_announcement(this_argPointer, msgPointer)
}
});
    }

    public func update_node_from_unsigned_announcement(this_arg: NetworkGraph, msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
NetworkGraph_update_node_from_unsigned_announcement(this_argPointer, msgPointer)
}
});
    }

    public func update_channel_from_announcement(this_arg: NetworkGraph, msg: ChannelAnnouncement, chain_access: Access) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (chain_accessPointer: UnsafeMutablePointer<LDKAccess>) in
NetworkGraph_update_channel_from_announcement(this_argPointer, msgPointer, chain_accessPointer)
}
}
});
    }

    public func update_channel_from_unsigned_announcement(this_arg: NetworkGraph, msg: UnsignedChannelAnnouncement, chain_access: Access) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
withUnsafeMutablePointer(to: &chain_access.cOpaqueStruct!) { (chain_accessPointer: UnsafeMutablePointer<LDKAccess>) in
NetworkGraph_update_channel_from_unsigned_announcement(this_argPointer, msgPointer, chain_accessPointer)
}
}
});
    }

    public func close_channel_from_update(this_arg: NetworkGraph, short_channel_id: UInt64, is_permanent: Bool) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
NetworkGraph_close_channel_from_update(this_argPointer, short_channel_id, is_permanent)
};
    }

    public func update_channel(this_arg: NetworkGraph, msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
NetworkGraph_update_channel(this_argPointer, msgPointer)
}
});
    }

    public func update_channel_unsigned(this_arg: NetworkGraph, msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NoneLightningErrorZ(pointer: withUnsafeMutablePointer(to: &this_arg.cOpaqueStruct!) { (this_argPointer: UnsafeMutablePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
NetworkGraph_update_channel_unsigned(this_argPointer, msgPointer)
}
});
    }

				
	deinit {
					
					
		NetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

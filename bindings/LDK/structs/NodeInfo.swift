public class NodeInfo {

    var cOpaqueStruct: LDKNodeInfo?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channels_arg: [UInt64], lowest_inbound_channel_fees_arg: RoutingFees, announcement_info_arg: NodeAnnouncementInfo) {
    	
		let converted_channels_arg = Bindings.new_LDKCVec_u64Z(array: channels_arg)
        self.cOpaqueStruct = NodeInfo_new(converted_channels_arg, lowest_inbound_channel_fees_arg.cOpaqueStruct!, announcement_info_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func set_channels(val: [UInt64]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeInfo>) in
NodeInfo_set_channels(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val))
};
    }

    public func get_lowest_inbound_channel_fees() -> RoutingFees {
    	/* NATIVE_CALL_PREP */
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_lowest_inbound_channel_fees(this_ptrPointer)
});
    }

    public func set_lowest_inbound_channel_fees(val: RoutingFees) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeInfo>) in
NodeInfo_set_lowest_inbound_channel_fees(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_announcement_info() -> NodeAnnouncementInfo {
    	/* NATIVE_CALL_PREP */
        return NodeAnnouncementInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_announcement_info(this_ptrPointer)
});
    }

    public func set_announcement_info(val: NodeAnnouncementInfo) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeInfo>) in
NodeInfo_set_announcement_info(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: NodeInfo) -> NodeInfo {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo(pointer: NodeInfo_clone(origPointer))
};
    }

    public func write(obj: NodeInfo) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NodeInfoDecodeErrorZ(pointer: NodeInfo_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		NodeInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

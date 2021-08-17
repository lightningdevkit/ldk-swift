import LDKHeaders

public class NodeInfo {

    public internal(set) var cOpaqueStruct: LDKNodeInfo?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channels_arg: [UInt64], lowest_inbound_channel_fees_arg: RoutingFees, announcement_info_arg: NodeAnnouncementInfo) {
    	
        self.cOpaqueStruct = NodeInfo_new(Bindings.new_LDKCVec_u64Z(array: channels_arg), lowest_inbound_channel_fees_arg.clone().cOpaqueStruct!, announcement_info_arg.clone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func set_channels(val: [UInt64]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeInfo_set_channels(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    public func get_lowest_inbound_channel_fees() -> RoutingFees {
    	
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_lowest_inbound_channel_fees(this_ptrPointer)
});
    }

    public func set_lowest_inbound_channel_fees(val: RoutingFees) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeInfo_set_lowest_inbound_channel_fees(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_announcement_info() -> NodeAnnouncementInfo {
    	
        return NodeAnnouncementInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_announcement_info(this_ptrPointer)
});
    }

    public func set_announcement_info(val: NodeAnnouncementInfo) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeInfo_set_announcement_info(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func clone() -> NodeInfo {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo(pointer: NodeInfo_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
    	
        return Result_NodeInfoDecodeErrorZ(pointer: NodeInfo_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		NodeInfo_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

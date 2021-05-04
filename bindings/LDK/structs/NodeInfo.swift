class NodeInfo {

    var cOpaqueStruct: LDKNodeInfo?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channels_arg: [UInt64], lowest_inbound_channel_fees_arg: RoutingFees, announcement_info_arg: NodeAnnouncementInfo) {
    	
		let converted_channels_arg = Bindings.new_LDKCVec_u64Z(array: channels_arg)
        self.cOpaqueStruct = NodeInfo_new(converted_channels_arg, lowest_inbound_channel_fees_arg.cOpaqueStruct!, announcement_info_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKNodeInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func set_channels(val: [UInt64]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_channels(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    func get_lowest_inbound_channel_fees() -> RoutingFees {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return RoutingFees(pointer: NodeInfo_get_lowest_inbound_channel_fees(this_ptrPointer));
    }

    func set_lowest_inbound_channel_fees(val: RoutingFees) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_lowest_inbound_channel_fees(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_announcement_info() -> NodeAnnouncementInfo {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo(pointer: NodeInfo_get_announcement_info(this_ptrPointer));
    }

    func set_announcement_info(val: NodeAnnouncementInfo) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_announcement_info(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: NodeInfo) -> NodeInfo {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo(pointer: NodeInfo_clone(origPointer));
    }

    func write(obj: NodeInfo) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: NodeInfo_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
    	
        return Result_NodeInfoDecodeErrorZ(pointer: NodeInfo_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		NodeInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class NodeInfo {

    var cOpaqueStruct: LDKNodeInfo?;

    init(channels_arg: [U], lowest_inbound_channel_fees_arg: RoutingFees, announcement_info_arg: NodeAnnouncementInfo) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = NodeInfo_new(channels_arg, lowest_inbound_channel_fees_arg, announcement_info_arg)
    }

    private init(pointer: LDKNodeInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func set_channels(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_channels(this_ptrPointer, val);
    }

    func get_lowest_inbound_channel_fees() -> RoutingFees {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_get_lowest_inbound_channel_fees(this_ptrPointer);
    }

    func set_lowest_inbound_channel_fees(val: RoutingFees) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_lowest_inbound_channel_fees(this_ptrPointer, val);
    }

    func get_announcement_info() -> NodeAnnouncementInfo {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_get_announcement_info(this_ptrPointer);
    }

    func set_announcement_info(val: NodeAnnouncementInfo) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_set_announcement_info(this_ptrPointer, val);
    }

    func clone(orig: NodeInfo) -> NodeInfo {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo(pointer: NodeInfo_clone(origPointer));
    }

    func write(obj: NodeInfo) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeInfo>) in
							
			pointer
						
		}
					
        return NodeInfo_write(objPointer);
    }

    func read(ser: [U]) -> Result_NodeInfoDecodeErrorZ {
    	
        return NodeInfo_read(ser);
    }

				
	deinit {
					
					
		NodeInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

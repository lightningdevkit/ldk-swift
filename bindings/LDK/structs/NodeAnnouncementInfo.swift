class NodeAnnouncementInfo {

    var cOpaqueStruct: LDKNodeAnnouncementInfo?;

    init(features_arg: NodeFeatures, last_update_arg: U, rgb_arg: [U], alias_arg: [U], addresses_arg: [NetAddress], announcement_message_arg: NodeAnnouncement) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = NodeAnnouncementInfo_new(features_arg, last_update_arg, rgb_arg, alias_arg, addresses_arg, announcement_message_arg)
    }

    private init(pointer: LDKNodeAnnouncementInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> NodeFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_get_features(this_ptrPointer);
    }

    func set_features(val: NodeFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_features(this_ptrPointer, val);
    }

    func get_last_update() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_get_last_update(this_ptrPointer);
    }

    func set_last_update(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_last_update(this_ptrPointer, val);
    }

    func get_rgb() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_get_rgb(this_ptrPointer);
    }

    func set_rgb(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_rgb(this_ptrPointer, val);
    }

    func get_alias() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_get_alias(this_ptrPointer);
    }

    func set_alias(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_alias(this_ptrPointer, val);
    }

    func set_addresses(val: [NetAddress]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_addresses(this_ptrPointer, val);
    }

    func get_announcement_message() -> NodeAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_get_announcement_message(this_ptrPointer);
    }

    func set_announcement_message(val: NodeAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_set_announcement_message(this_ptrPointer, val);
    }

    func clone(orig: NodeAnnouncementInfo) -> NodeAnnouncementInfo {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo(pointer: NodeAnnouncementInfo_clone(origPointer));
    }

    func write(obj: NodeAnnouncementInfo) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
							
			pointer
						
		}
					
        return NodeAnnouncementInfo_write(objPointer);
    }

    func read(ser: [U]) -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	
        return NodeAnnouncementInfo_read(ser);
    }

				
	deinit {
					
					
		NodeAnnouncementInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

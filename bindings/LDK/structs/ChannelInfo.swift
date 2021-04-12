class ChannelInfo {

    var cOpaqueStruct: LDKChannelInfo?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKChannelInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> ChannelFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_features(this_ptrPointer);
    }

    func set_features(val: ChannelFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_features(this_ptrPointer, val);
    }

    func get_node_one() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_node_one(this_ptrPointer);
    }

    func set_node_one(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_node_one(this_ptrPointer, val);
    }

    func get_one_to_two() -> DirectionalChannelInfo {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_one_to_two(this_ptrPointer);
    }

    func set_one_to_two(val: DirectionalChannelInfo) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_one_to_two(this_ptrPointer, val);
    }

    func get_node_two() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_node_two(this_ptrPointer);
    }

    func set_node_two(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_node_two(this_ptrPointer, val);
    }

    func get_two_to_one() -> DirectionalChannelInfo {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_two_to_one(this_ptrPointer);
    }

    func set_two_to_one(val: DirectionalChannelInfo) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_two_to_one(this_ptrPointer, val);
    }

    func get_announcement_message() -> ChannelAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_get_announcement_message(this_ptrPointer);
    }

    func set_announcement_message(val: ChannelAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_set_announcement_message(this_ptrPointer, val);
    }

    func clone(orig: ChannelInfo) -> ChannelInfo {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo(pointer: ChannelInfo_clone(origPointer));
    }

    func write(obj: ChannelInfo) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelInfo>) in
							
			pointer
						
		}
					
        return ChannelInfo_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelInfoDecodeErrorZ {
    	
        return ChannelInfo_read(ser);
    }

				
	deinit {
					
					
		ChannelInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

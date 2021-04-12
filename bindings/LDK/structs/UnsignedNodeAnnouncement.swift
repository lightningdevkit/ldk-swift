class UnsignedNodeAnnouncement {

    var cOpaqueStruct: LDKUnsignedNodeAnnouncement?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUnsignedNodeAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> NodeFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_features(this_ptrPointer);
    }

    func set_features(val: NodeFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_features(this_ptrPointer, val);
    }

    func get_timestamp() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_timestamp(this_ptrPointer);
    }

    func set_timestamp(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_timestamp(this_ptrPointer, val);
    }

    func get_node_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_node_id(this_ptrPointer);
    }

    func set_node_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_node_id(this_ptrPointer, val);
    }

    func get_rgb() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_rgb(this_ptrPointer);
    }

    func set_rgb(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_rgb(this_ptrPointer, val);
    }

    func get_alias() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_alias(this_ptrPointer);
    }

    func set_alias(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_alias(this_ptrPointer, val);
    }

    func set_addresses(val: [NetAddress]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_addresses(this_ptrPointer, val);
    }

    func clone(orig: UnsignedNodeAnnouncement) -> UnsignedNodeAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement(pointer: UnsignedNodeAnnouncement_clone(origPointer));
    }

    func write(obj: UnsignedNodeAnnouncement) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_write(objPointer);
    }

    func read(ser: [U]) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return UnsignedNodeAnnouncement_read(ser);
    }

				
	deinit {
					
					
		UnsignedNodeAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

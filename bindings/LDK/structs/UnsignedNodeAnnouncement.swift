class UnsignedNodeAnnouncement {

    var cOpaqueStruct: LDKUnsignedNodeAnnouncement?;

	

    init(pointer: LDKUnsignedNodeAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> NodeFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeFeatures(pointer: UnsignedNodeAnnouncement_get_features(this_ptrPointer));
    }

    func set_features(val: NodeFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_timestamp() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_timestamp(this_ptrPointer);
    }

    func set_timestamp(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_timestamp(this_ptrPointer, val);
    }

    func get_node_id() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: UnsignedNodeAnnouncement_get_node_id(this_ptrPointer));
    }

    func set_node_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_node_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_rgb() -> (UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_rgb(this_ptrPointer).pointee;
    }

    func set_rgb(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_rgb(this_ptrPointer, Bindings.new_LDKThreeBytes(array: val));
    }

    func get_alias() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_get_alias(this_ptrPointer).pointee;
    }

    func set_alias(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_alias(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func set_addresses(val: [LDKNetAddress]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement_set_addresses(this_ptrPointer, Bindings.new_LDKCVec_NetAddressZ(array: val));
    }

    func clone(orig: UnsignedNodeAnnouncement) -> UnsignedNodeAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement(pointer: UnsignedNodeAnnouncement_clone(origPointer));
    }

    func write(obj: UnsignedNodeAnnouncement) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: UnsignedNodeAnnouncement_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: UnsignedNodeAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UnsignedNodeAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

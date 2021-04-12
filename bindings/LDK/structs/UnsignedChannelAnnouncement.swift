class UnsignedChannelAnnouncement {

    var cOpaqueStruct: LDKUnsignedChannelAnnouncement?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUnsignedChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> ChannelFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_features(this_ptrPointer);
    }

    func set_features(val: ChannelFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_features(this_ptrPointer, val);
    }

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_chain_hash(this_ptrPointer, val);
    }

    func get_short_channel_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_short_channel_id(this_ptrPointer, val);
    }

    func get_node_id_1() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_node_id_1(this_ptrPointer);
    }

    func set_node_id_1(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_node_id_1(this_ptrPointer, val);
    }

    func get_node_id_2() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_node_id_2(this_ptrPointer);
    }

    func set_node_id_2(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_node_id_2(this_ptrPointer, val);
    }

    func get_bitcoin_key_1() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_bitcoin_key_1(this_ptrPointer);
    }

    func set_bitcoin_key_1(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_bitcoin_key_1(this_ptrPointer, val);
    }

    func get_bitcoin_key_2() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_bitcoin_key_2(this_ptrPointer);
    }

    func set_bitcoin_key_2(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_bitcoin_key_2(this_ptrPointer, val);
    }

    func clone(orig: UnsignedChannelAnnouncement) -> UnsignedChannelAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement(pointer: UnsignedChannelAnnouncement_clone(origPointer));
    }

    func write(obj: UnsignedChannelAnnouncement) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_write(objPointer);
    }

    func read(ser: [U]) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return UnsignedChannelAnnouncement_read(ser);
    }

				
	deinit {
					
					
		UnsignedChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

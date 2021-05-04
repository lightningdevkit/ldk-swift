class UnsignedChannelAnnouncement {

    var cOpaqueStruct: LDKUnsignedChannelAnnouncement?;

	

    init(pointer: LDKUnsignedChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> ChannelFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelFeatures(pointer: UnsignedChannelAnnouncement_get_features(this_ptrPointer));
    }

    func set_features(val: ChannelFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_chain_hash(this_ptrPointer).pointee;
    }

    func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_short_channel_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_short_channel_id(this_ptrPointer, val);
    }

    func get_node_id_1() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: UnsignedChannelAnnouncement_get_node_id_1(this_ptrPointer));
    }

    func set_node_id_1(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_node_id_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_node_id_2() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: UnsignedChannelAnnouncement_get_node_id_2(this_ptrPointer));
    }

    func set_node_id_2(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_node_id_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_bitcoin_key_1() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: UnsignedChannelAnnouncement_get_bitcoin_key_1(this_ptrPointer));
    }

    func set_bitcoin_key_1(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_bitcoin_key_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_bitcoin_key_2() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: UnsignedChannelAnnouncement_get_bitcoin_key_2(this_ptrPointer));
    }

    func set_bitcoin_key_2(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement_set_bitcoin_key_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func clone(orig: UnsignedChannelAnnouncement) -> UnsignedChannelAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement(pointer: UnsignedChannelAnnouncement_clone(origPointer));
    }

    func write(obj: UnsignedChannelAnnouncement) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: UnsignedChannelAnnouncement_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: UnsignedChannelAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UnsignedChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

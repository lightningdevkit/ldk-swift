class UnsignedChannelUpdate {

    var cOpaqueStruct: LDKUnsignedChannelUpdate?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUnsignedChannelUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_chain_hash(this_ptrPointer, val);
    }

    func get_short_channel_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_short_channel_id(this_ptrPointer, val);
    }

    func get_timestamp() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_timestamp(this_ptrPointer);
    }

    func set_timestamp(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_timestamp(this_ptrPointer, val);
    }

    func get_flags() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_flags(this_ptrPointer);
    }

    func set_flags(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_flags(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func get_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_htlc_minimum_msat(this_ptrPointer);
    }

    func set_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_fee_base_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_fee_base_msat(this_ptrPointer);
    }

    func set_fee_base_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_fee_base_msat(this_ptrPointer, val);
    }

    func get_fee_proportional_millionths() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_get_fee_proportional_millionths(this_ptrPointer);
    }

    func set_fee_proportional_millionths(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_set_fee_proportional_millionths(this_ptrPointer, val);
    }

    func clone(orig: UnsignedChannelUpdate) -> UnsignedChannelUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate(pointer: UnsignedChannelUpdate_clone(origPointer));
    }

    func write(obj: UnsignedChannelUpdate) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate_write(objPointer);
    }

    func read(ser: [U]) -> Result_UnsignedChannelUpdateDecodeErrorZ {
    	
        return UnsignedChannelUpdate_read(ser);
    }

				
	deinit {
					
					
		UnsignedChannelUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

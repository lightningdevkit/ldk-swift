class UpdateAddHTLC {

    var cOpaqueStruct: LDKUpdateAddHTLC?;

	

    init(pointer: LDKUpdateAddHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_htlc_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_htlc_id(this_ptrPointer);
    }

    func set_htlc_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_htlc_id(this_ptrPointer, val);
    }

    func get_amount_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_amount_msat(this_ptrPointer);
    }

    func set_amount_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_amount_msat(this_ptrPointer, val);
    }

    func get_payment_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_payment_hash(this_ptrPointer).pointee;
    }

    func set_payment_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_payment_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_cltv_expiry() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_cltv_expiry(this_ptrPointer);
    }

    func set_cltv_expiry(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_cltv_expiry(this_ptrPointer, val);
    }

    func clone(orig: UpdateAddHTLC) -> UpdateAddHTLC {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC(pointer: UpdateAddHTLC_clone(origPointer));
    }

    func write(obj: UpdateAddHTLC) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: UpdateAddHTLC_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_UpdateAddHTLCDecodeErrorZ {
    	
        return Result_UpdateAddHTLCDecodeErrorZ(pointer: UpdateAddHTLC_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UpdateAddHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

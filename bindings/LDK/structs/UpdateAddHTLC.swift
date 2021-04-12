class UpdateAddHTLC {

    var cOpaqueStruct: LDKUpdateAddHTLC?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUpdateAddHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_channel_id(this_ptrPointer, val);
    }

    func get_htlc_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_htlc_id(this_ptrPointer);
    }

    func set_htlc_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_htlc_id(this_ptrPointer, val);
    }

    func get_amount_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_amount_msat(this_ptrPointer);
    }

    func set_amount_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_amount_msat(this_ptrPointer, val);
    }

    func get_payment_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_payment_hash(this_ptrPointer);
    }

    func set_payment_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_set_payment_hash(this_ptrPointer, val);
    }

    func get_cltv_expiry() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_get_cltv_expiry(this_ptrPointer);
    }

    func set_cltv_expiry(val: U) -> Void {
    	
						
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

    func write(obj: UpdateAddHTLC) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateAddHTLC>) in
							
			pointer
						
		}
					
        return UpdateAddHTLC_write(objPointer);
    }

    func read(ser: [U]) -> Result_UpdateAddHTLCDecodeErrorZ {
    	
        return UpdateAddHTLC_read(ser);
    }

				
	deinit {
					
					
		UpdateAddHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

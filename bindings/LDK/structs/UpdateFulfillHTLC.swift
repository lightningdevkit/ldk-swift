class UpdateFulfillHTLC {

    var cOpaqueStruct: LDKUpdateFulfillHTLC?;

    init(channel_id_arg: [U], htlc_id_arg: U, payment_preimage_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = UpdateFulfillHTLC_new(channel_id_arg, htlc_id_arg, payment_preimage_arg)
    }

    private init(pointer: LDKUpdateFulfillHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_set_channel_id(this_ptrPointer, val);
    }

    func get_htlc_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_get_htlc_id(this_ptrPointer);
    }

    func set_htlc_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_set_htlc_id(this_ptrPointer, val);
    }

    func get_payment_preimage() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_get_payment_preimage(this_ptrPointer);
    }

    func set_payment_preimage(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_set_payment_preimage(this_ptrPointer, val);
    }

    func clone(orig: UpdateFulfillHTLC) -> UpdateFulfillHTLC {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC(pointer: UpdateFulfillHTLC_clone(origPointer));
    }

    func write(obj: UpdateFulfillHTLC) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
							
			pointer
						
		}
					
        return UpdateFulfillHTLC_write(objPointer);
    }

    func read(ser: [U]) -> Result_UpdateFulfillHTLCDecodeErrorZ {
    	
        return UpdateFulfillHTLC_read(ser);
    }

				
	deinit {
					
					
		UpdateFulfillHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

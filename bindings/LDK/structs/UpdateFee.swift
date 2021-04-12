class UpdateFee {

    var cOpaqueStruct: LDKUpdateFee?;

    init(channel_id_arg: [U], feerate_per_kw_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = UpdateFee_new(channel_id_arg, feerate_per_kw_arg)
    }

    private init(pointer: LDKUpdateFee){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_set_channel_id(this_ptrPointer, val);
    }

    func get_feerate_per_kw() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_get_feerate_per_kw(this_ptrPointer);
    }

    func set_feerate_per_kw(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_set_feerate_per_kw(this_ptrPointer, val);
    }

    func clone(orig: UpdateFee) -> UpdateFee {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee(pointer: UpdateFee_clone(origPointer));
    }

    func write(obj: UpdateFee) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_write(objPointer);
    }

    func read(ser: [U]) -> Result_UpdateFeeDecodeErrorZ {
    	
        return UpdateFee_read(ser);
    }

				
	deinit {
					
					
		UpdateFee_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class UpdateFee {

    var cOpaqueStruct: LDKUpdateFee?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channel_id_arg: [UInt8], feerate_per_kw_arg: UInt32) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
        self.cOpaqueStruct = UpdateFee_new(converted_channel_id_arg, feerate_per_kw_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKUpdateFee){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_feerate_per_kw() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return UpdateFee_get_feerate_per_kw(this_ptrPointer);
    }

    func set_feerate_per_kw(val: UInt32) -> Void {
    	
						
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

    func write(obj: UpdateFee) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFee>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: UpdateFee_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_UpdateFeeDecodeErrorZ {
    	
        return Result_UpdateFeeDecodeErrorZ(pointer: UpdateFee_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UpdateFee_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class FundingSigned {

    var cOpaqueStruct: LDKFundingSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channel_id_arg: [UInt8], signature_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = FundingSigned_new(converted_channel_id_arg, converted_signature_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKFundingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: FundingSigned_get_signature(this_ptrPointer));
    }

    func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func clone(orig: FundingSigned) -> FundingSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned(pointer: FundingSigned_clone(origPointer));
    }

    func write(obj: FundingSigned) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: FundingSigned_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: FundingSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		FundingSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

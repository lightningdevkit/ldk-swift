class FundingSigned {

    var cOpaqueStruct: LDKFundingSigned?;

    init(channel_id_arg: [U], signature_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = FundingSigned_new(channel_id_arg, signature_arg)
    }

    private init(pointer: LDKFundingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_set_channel_id(this_ptrPointer, val);
    }

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_set_signature(this_ptrPointer, val);
    }

    func clone(orig: FundingSigned) -> FundingSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned(pointer: FundingSigned_clone(origPointer));
    }

    func write(obj: FundingSigned) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingSigned>) in
							
			pointer
						
		}
					
        return FundingSigned_write(objPointer);
    }

    func read(ser: [U]) -> Result_FundingSignedDecodeErrorZ {
    	
        return FundingSigned_read(ser);
    }

				
	deinit {
					
					
		FundingSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

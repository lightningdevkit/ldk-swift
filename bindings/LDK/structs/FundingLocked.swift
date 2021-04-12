class FundingLocked {

    var cOpaqueStruct: LDKFundingLocked?;

    init(channel_id_arg: [U], next_per_commitment_point_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = FundingLocked_new(channel_id_arg, next_per_commitment_point_arg)
    }

    private init(pointer: LDKFundingLocked){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_set_channel_id(this_ptrPointer, val);
    }

    func get_next_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_get_next_per_commitment_point(this_ptrPointer);
    }

    func set_next_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_set_next_per_commitment_point(this_ptrPointer, val);
    }

    func clone(orig: FundingLocked) -> FundingLocked {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked(pointer: FundingLocked_clone(origPointer));
    }

    func write(obj: FundingLocked) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_write(objPointer);
    }

    func read(ser: [U]) -> Result_FundingLockedDecodeErrorZ {
    	
        return FundingLocked_read(ser);
    }

				
	deinit {
					
					
		FundingLocked_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

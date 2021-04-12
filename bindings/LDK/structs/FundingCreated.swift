class FundingCreated {

    var cOpaqueStruct: LDKFundingCreated?;

    init(temporary_channel_id_arg: [U], funding_txid_arg: [U], funding_output_index_arg: U, signature_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = FundingCreated_new(temporary_channel_id_arg, funding_txid_arg, funding_output_index_arg, signature_arg)
    }

    private init(pointer: LDKFundingCreated){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_temporary_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_temporary_channel_id(this_ptrPointer);
    }

    func set_temporary_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_temporary_channel_id(this_ptrPointer, val);
    }

    func get_funding_txid() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_funding_txid(this_ptrPointer);
    }

    func set_funding_txid(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_funding_txid(this_ptrPointer, val);
    }

    func get_funding_output_index() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_funding_output_index(this_ptrPointer);
    }

    func set_funding_output_index(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_funding_output_index(this_ptrPointer, val);
    }

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_signature(this_ptrPointer, val);
    }

    func clone(orig: FundingCreated) -> FundingCreated {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated(pointer: FundingCreated_clone(origPointer));
    }

    func write(obj: FundingCreated) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_write(objPointer);
    }

    func read(ser: [U]) -> Result_FundingCreatedDecodeErrorZ {
    	
        return FundingCreated_read(ser);
    }

				
	deinit {
					
					
		FundingCreated_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

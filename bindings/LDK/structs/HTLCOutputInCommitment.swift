class HTLCOutputInCommitment {

    var cOpaqueStruct: LDKHTLCOutputInCommitment?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKHTLCOutputInCommitment){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_offered() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_offered(this_ptrPointer);
    }

    func set_offered(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_offered(this_ptrPointer, val);
    }

    func get_amount_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_amount_msat(this_ptrPointer);
    }

    func set_amount_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_amount_msat(this_ptrPointer, val);
    }

    func get_cltv_expiry() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_cltv_expiry(this_ptrPointer);
    }

    func set_cltv_expiry(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_cltv_expiry(this_ptrPointer, val);
    }

    func get_payment_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_payment_hash(this_ptrPointer);
    }

    func set_payment_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_payment_hash(this_ptrPointer, val);
    }

    func clone(orig: HTLCOutputInCommitment) -> HTLCOutputInCommitment {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment(pointer: HTLCOutputInCommitment_clone(origPointer));
    }

    func write(obj: HTLCOutputInCommitment) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_write(objPointer);
    }

    func read(ser: [U]) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return HTLCOutputInCommitment_read(ser);
    }

				
	deinit {
					
					
		HTLCOutputInCommitment_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

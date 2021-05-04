class HTLCOutputInCommitment {

    var cOpaqueStruct: LDKHTLCOutputInCommitment?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(offered_arg: Bool, amount_msat_arg: UInt64, cltv_expiry_arg: UInt32, payment_hash_arg: [UInt8], transaction_output_index_arg: Option_u32Z) {
    	
		let converted_payment_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: payment_hash_arg)
        self.cOpaqueStruct = HTLCOutputInCommitment_new(offered_arg, amount_msat_arg, cltv_expiry_arg, converted_payment_hash_arg, transaction_output_index_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKHTLCOutputInCommitment){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_offered() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_offered(this_ptrPointer);
    }

    func set_offered(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_offered(this_ptrPointer, val);
    }

    func get_amount_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_amount_msat(this_ptrPointer);
    }

    func set_amount_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_amount_msat(this_ptrPointer, val);
    }

    func get_cltv_expiry() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_cltv_expiry(this_ptrPointer);
    }

    func set_cltv_expiry(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_cltv_expiry(this_ptrPointer, val);
    }

    func get_payment_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_get_payment_hash(this_ptrPointer).pointee;
    }

    func set_payment_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_payment_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_transaction_output_index() -> Option_u32Z {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return Option_u32Z(pointer: HTLCOutputInCommitment_get_transaction_output_index(this_ptrPointer));
    }

    func set_transaction_output_index(val: Option_u32Z) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment_set_transaction_output_index(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: HTLCOutputInCommitment) -> HTLCOutputInCommitment {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return HTLCOutputInCommitment(pointer: HTLCOutputInCommitment_clone(origPointer));
    }

    func write(obj: HTLCOutputInCommitment) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: HTLCOutputInCommitment_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return Result_HTLCOutputInCommitmentDecodeErrorZ(pointer: HTLCOutputInCommitment_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		HTLCOutputInCommitment_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

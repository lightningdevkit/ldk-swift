class CommitmentUpdate {

    var cOpaqueStruct: LDKCommitmentUpdate?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(update_add_htlcs_arg: [UpdateAddHTLC], update_fulfill_htlcs_arg: [UpdateFulfillHTLC], update_fail_htlcs_arg: [UpdateFailHTLC], update_fail_malformed_htlcs_arg: [UpdateFailMalformedHTLC], update_fee_arg: UpdateFee, commitment_signed_arg: CommitmentSigned) {
    	
		let converted_update_add_htlcs_arg = Bindings.new_LDKCVec_UpdateAddHTLCZ(array: update_add_htlcs_arg)
		let converted_update_fulfill_htlcs_arg = Bindings.new_LDKCVec_UpdateFulfillHTLCZ(array: update_fulfill_htlcs_arg)
		let converted_update_fail_htlcs_arg = Bindings.new_LDKCVec_UpdateFailHTLCZ(array: update_fail_htlcs_arg)
		let converted_update_fail_malformed_htlcs_arg = Bindings.new_LDKCVec_UpdateFailMalformedHTLCZ(array: update_fail_malformed_htlcs_arg)
        self.cOpaqueStruct = CommitmentUpdate_new(converted_update_add_htlcs_arg, converted_update_fulfill_htlcs_arg, converted_update_fail_htlcs_arg, converted_update_fail_malformed_htlcs_arg, update_fee_arg.cOpaqueStruct!, commitment_signed_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKCommitmentUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func set_update_add_htlcs(val: [UpdateAddHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_add_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateAddHTLCZ(array: val));
    }

    func set_update_fulfill_htlcs(val: [UpdateFulfillHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fulfill_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFulfillHTLCZ(array: val));
    }

    func set_update_fail_htlcs(val: [UpdateFailHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fail_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFailHTLCZ(array: val));
    }

    func set_update_fail_malformed_htlcs(val: [UpdateFailMalformedHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fail_malformed_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFailMalformedHTLCZ(array: val));
    }

    func get_update_fee() -> UpdateFee {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return UpdateFee(pointer: CommitmentUpdate_get_update_fee(this_ptrPointer));
    }

    func set_update_fee(val: UpdateFee) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fee(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_commitment_signed() -> CommitmentSigned {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentSigned(pointer: CommitmentUpdate_get_commitment_signed(this_ptrPointer));
    }

    func set_commitment_signed(val: CommitmentSigned) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_commitment_signed(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: CommitmentUpdate) -> CommitmentUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate(pointer: CommitmentUpdate_clone(origPointer));
    }

				
	deinit {
					
					
		CommitmentUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

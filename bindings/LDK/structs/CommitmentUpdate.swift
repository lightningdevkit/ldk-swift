class CommitmentUpdate {

    var cOpaqueStruct: LDKCommitmentUpdate?;

    init(update_add_htlcs_arg: [UpdateAddHTLC], update_fulfill_htlcs_arg: [UpdateFulfillHTLC], update_fail_htlcs_arg: [UpdateFailHTLC], update_fail_malformed_htlcs_arg: [UpdateFailMalformedHTLC], update_fee_arg: UpdateFee, commitment_signed_arg: CommitmentSigned) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = CommitmentUpdate_new(update_add_htlcs_arg, update_fulfill_htlcs_arg, update_fail_htlcs_arg, update_fail_malformed_htlcs_arg, update_fee_arg, commitment_signed_arg)
    }

    private init(pointer: LDKCommitmentUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func set_update_add_htlcs(val: [UpdateAddHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_add_htlcs(this_ptrPointer, val);
    }

    func set_update_fulfill_htlcs(val: [UpdateFulfillHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fulfill_htlcs(this_ptrPointer, val);
    }

    func set_update_fail_htlcs(val: [UpdateFailHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fail_htlcs(this_ptrPointer, val);
    }

    func set_update_fail_malformed_htlcs(val: [UpdateFailMalformedHTLC]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fail_malformed_htlcs(this_ptrPointer, val);
    }

    func get_update_fee() -> UpdateFee {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_get_update_fee(this_ptrPointer);
    }

    func set_update_fee(val: UpdateFee) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_update_fee(this_ptrPointer, val);
    }

    func get_commitment_signed() -> CommitmentSigned {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_get_commitment_signed(this_ptrPointer);
    }

    func set_commitment_signed(val: CommitmentSigned) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentUpdate>) in
							
			pointer
						
		}
					
        return CommitmentUpdate_set_commitment_signed(this_ptrPointer, val);
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

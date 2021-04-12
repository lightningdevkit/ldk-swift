class HolderCommitmentTransaction {

    var cOpaqueStruct: LDKHolderCommitmentTransaction?;

    init(commitment_tx: CommitmentTransaction, counterparty_sig: [U], counterparty_htlc_sigs: [[U]], holder_funding_key: [U], counterparty_funding_key: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = HolderCommitmentTransaction_new(commitment_tx, counterparty_sig, counterparty_htlc_sigs, holder_funding_key, counterparty_funding_key)
    }

    private init(pointer: LDKHolderCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_counterparty_sig() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_get_counterparty_sig(this_ptrPointer);
    }

    func set_counterparty_sig(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_set_counterparty_sig(this_ptrPointer, val);
    }

    func set_counterparty_htlc_sigs(val: [[U]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_set_counterparty_htlc_sigs(this_ptrPointer, val);
    }

    func clone(orig: HolderCommitmentTransaction) -> HolderCommitmentTransaction {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction(pointer: HolderCommitmentTransaction_clone(origPointer));
    }

    func write(obj: HolderCommitmentTransaction) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_write(objPointer);
    }

    func read(ser: [U]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return HolderCommitmentTransaction_read(ser);
    }

				
	deinit {
					
					
		HolderCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

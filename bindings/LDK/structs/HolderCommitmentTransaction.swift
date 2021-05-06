public class HolderCommitmentTransaction {

    var cOpaqueStruct: LDKHolderCommitmentTransaction?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(commitment_tx: CommitmentTransaction, counterparty_sig: [UInt8], counterparty_htlc_sigs: [[UInt8]], holder_funding_key: [UInt8], counterparty_funding_key: [UInt8]) {
    	
		let converted_counterparty_sig = Bindings.new_LDKSignature(array: counterparty_sig)
		let converted_counterparty_htlc_sigs = Bindings.new_LDKCVec_SignatureZ(array: counterparty_htlc_sigs)
		let converted_holder_funding_key = Bindings.new_LDKPublicKey(array: holder_funding_key)
		let converted_counterparty_funding_key = Bindings.new_LDKPublicKey(array: counterparty_funding_key)
        self.cOpaqueStruct = HolderCommitmentTransaction_new(commitment_tx.cOpaqueStruct!, converted_counterparty_sig, converted_counterparty_htlc_sigs, converted_holder_funding_key, converted_counterparty_funding_key)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKHolderCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_counterparty_sig() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: HolderCommitmentTransaction_get_counterparty_sig(this_ptrPointer));
    }

    public func set_counterparty_sig(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_set_counterparty_sig(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func set_counterparty_htlc_sigs(val: [[UInt8]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction_set_counterparty_htlc_sigs(this_ptrPointer, Bindings.new_LDKCVec_SignatureZ(array: val));
    }

    public func clone(orig: HolderCommitmentTransaction) -> HolderCommitmentTransaction {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return HolderCommitmentTransaction(pointer: HolderCommitmentTransaction_clone(origPointer));
    }

    public func write(obj: HolderCommitmentTransaction) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: HolderCommitmentTransaction_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: HolderCommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		HolderCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class HolderCommitmentTransaction {

    public internal(set) var cOpaqueStruct: LDKHolderCommitmentTransaction?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(commitment_tx: CommitmentTransaction, counterparty_sig: [UInt8], counterparty_htlc_sigs: [[UInt8]], holder_funding_key: [UInt8], counterparty_funding_key: [UInt8]) {
    	
        self.cOpaqueStruct = HolderCommitmentTransaction_new(commitment_tx.clone().cOpaqueStruct!, Bindings.new_LDKSignature(array: counterparty_sig), Bindings.new_LDKCVec_SignatureZ(array: counterparty_htlc_sigs), Bindings.new_LDKPublicKey(array: holder_funding_key), Bindings.new_LDKPublicKey(array: counterparty_funding_key))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKHolderCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_counterparty_sig() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_get_counterparty_sig(this_ptrPointer)
});
    }

    public func set_counterparty_sig(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHolderCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HolderCommitmentTransaction_set_counterparty_sig(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func set_counterparty_htlc_sigs(val: [[UInt8]]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHolderCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HolderCommitmentTransaction_set_counterparty_htlc_sigs(this_ptrPointer, Bindings.new_LDKCVec_SignatureZ(array: val));
    }

    public func clone() -> HolderCommitmentTransaction {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction(pointer: HolderCommitmentTransaction_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: HolderCommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		HolderCommitmentTransaction_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

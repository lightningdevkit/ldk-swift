import LDKHeaders

public class HolderCommitmentTransaction {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKHolderCommitmentTransaction?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(commitment_tx: CommitmentTransaction, counterparty_sig: [UInt8], counterparty_htlc_sigs: [[UInt8]], holder_funding_key: [UInt8], counterparty_funding_key: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = HolderCommitmentTransaction_new(commitment_tx.danglingClone().cOpaqueStruct!, Bindings.new_LDKSignature(array: counterparty_sig), Bindings.new_LDKCVec_SignatureZ(array: counterparty_htlc_sigs), Bindings.new_LDKPublicKey(array: holder_funding_key), Bindings.new_LDKPublicKey(array: counterparty_funding_key))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKHolderCommitmentTransaction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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
    	
        return HolderCommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_clone(origPointer)
});
    }

					internal func danglingClone() -> HolderCommitmentTransaction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
HolderCommitmentTransaction_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: HolderCommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return HolderCommitmentTransaction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> HolderCommitmentTransaction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

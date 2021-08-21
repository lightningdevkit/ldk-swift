import LDKHeaders

public class CommitmentUpdate {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCommitmentUpdate?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(update_add_htlcs_arg: [LDKUpdateAddHTLC], update_fulfill_htlcs_arg: [LDKUpdateFulfillHTLC], update_fail_htlcs_arg: [LDKUpdateFailHTLC], update_fail_malformed_htlcs_arg: [LDKUpdateFailMalformedHTLC], update_fee_arg: UpdateFee, commitment_signed_arg: CommitmentSigned) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let update_add_htlcs_argWrapper = Bindings.new_LDKCVec_UpdateAddHTLCZWrapper(array: update_add_htlcs_arg)
						defer {
							update_add_htlcs_argWrapper.noOpRetain()
						}
					
						let update_fulfill_htlcs_argWrapper = Bindings.new_LDKCVec_UpdateFulfillHTLCZWrapper(array: update_fulfill_htlcs_arg)
						defer {
							update_fulfill_htlcs_argWrapper.noOpRetain()
						}
					
						let update_fail_htlcs_argWrapper = Bindings.new_LDKCVec_UpdateFailHTLCZWrapper(array: update_fail_htlcs_arg)
						defer {
							update_fail_htlcs_argWrapper.noOpRetain()
						}
					
						let update_fail_malformed_htlcs_argWrapper = Bindings.new_LDKCVec_UpdateFailMalformedHTLCZWrapper(array: update_fail_malformed_htlcs_arg)
						defer {
							update_fail_malformed_htlcs_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = CommitmentUpdate_new(update_add_htlcs_argWrapper.dangle().cOpaqueStruct!, update_fulfill_htlcs_argWrapper.dangle().cOpaqueStruct!, update_fail_htlcs_argWrapper.dangle().cOpaqueStruct!, update_fail_malformed_htlcs_argWrapper.dangle().cOpaqueStruct!, update_fee_arg.danglingClone().cOpaqueStruct!, commitment_signed_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCommitmentUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func set_update_add_htlcs(val: [LDKUpdateAddHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateAddHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_add_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func set_update_fulfill_htlcs(val: [LDKUpdateFulfillHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateFulfillHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_fulfill_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func set_update_fail_htlcs(val: [LDKUpdateFailHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateFailHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_fail_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func set_update_fail_malformed_htlcs(val: [LDKUpdateFailMalformedHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateFailMalformedHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_fail_malformed_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_update_fee() -> UpdateFee {
    	
        return UpdateFee(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_update_fee(this_ptrPointer)
});
    }

    public func set_update_fee(val: UpdateFee) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CommitmentUpdate_set_update_fee(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_commitment_signed() -> CommitmentSigned {
    	
        return CommitmentSigned(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_commitment_signed(this_ptrPointer)
});
    }

    public func set_commitment_signed(val: CommitmentSigned) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CommitmentUpdate_set_commitment_signed(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> CommitmentUpdate {
    	
        return CommitmentUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> CommitmentUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return CommitmentUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> CommitmentUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing CommitmentUpdate \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing CommitmentUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

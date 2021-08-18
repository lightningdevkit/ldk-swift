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
    	
        self.cOpaqueStruct = CommitmentUpdate_new(Bindings.new_LDKCVec_UpdateAddHTLCZ(array: update_add_htlcs_arg), Bindings.new_LDKCVec_UpdateFulfillHTLCZ(array: update_fulfill_htlcs_arg), Bindings.new_LDKCVec_UpdateFailHTLCZ(array: update_fail_htlcs_arg), Bindings.new_LDKCVec_UpdateFailMalformedHTLCZ(array: update_fail_malformed_htlcs_arg), update_fee_arg.danglingClone().cOpaqueStruct!, commitment_signed_arg.danglingClone().cOpaqueStruct!)
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
						
        return CommitmentUpdate_set_update_add_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateAddHTLCZ(array: val));
    }

    public func set_update_fulfill_htlcs(val: [LDKUpdateFulfillHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CommitmentUpdate_set_update_fulfill_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFulfillHTLCZ(array: val));
    }

    public func set_update_fail_htlcs(val: [LDKUpdateFailHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CommitmentUpdate_set_update_fail_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFailHTLCZ(array: val));
    }

    public func set_update_fail_malformed_htlcs(val: [LDKUpdateFailMalformedHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CommitmentUpdate_set_update_fail_malformed_htlcs(this_ptrPointer, Bindings.new_LDKCVec_UpdateFailMalformedHTLCZ(array: val));
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
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

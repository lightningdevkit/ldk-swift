#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class CommitmentUpdate: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCommitmentUpdate?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(update_add_htlcs_arg: [LDKUpdateAddHTLC], update_fulfill_htlcs_arg: [LDKUpdateFulfillHTLC], update_fail_htlcs_arg: [LDKUpdateFailHTLC], update_fail_malformed_htlcs_arg: [LDKUpdateFailMalformedHTLC], update_fee_arg: UpdateFee, commitment_signed_arg: CommitmentSigned) {
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
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCommitmentUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCommitmentUpdate, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(update_add_htlcs_arg: [UpdateAddHTLC], update_fulfill_htlcs_arg: [UpdateFulfillHTLC], update_fail_htlcs_arg: [UpdateFailHTLC], update_fail_malformed_htlcs_arg: [UpdateFailMalformedHTLC], update_fee_arg: UpdateFee, commitment_signed_arg: CommitmentSigned)  {
    	
							let update_add_htlcs_argUnwrapped = update_add_htlcs_arg.map { (update_add_htlcs_argCurrentValue) in
							update_add_htlcs_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
							let update_fulfill_htlcs_argUnwrapped = update_fulfill_htlcs_arg.map { (update_fulfill_htlcs_argCurrentValue) in
							update_fulfill_htlcs_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
							let update_fail_htlcs_argUnwrapped = update_fail_htlcs_arg.map { (update_fail_htlcs_argCurrentValue) in
							update_fail_htlcs_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
							let update_fail_malformed_htlcs_argUnwrapped = update_fail_malformed_htlcs_arg.map { (update_fail_malformed_htlcs_argCurrentValue) in
							update_fail_malformed_htlcs_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        self.init(update_add_htlcs_arg: update_add_htlcs_argUnwrapped, update_fulfill_htlcs_arg: update_fulfill_htlcs_argUnwrapped, update_fail_htlcs_arg: update_fail_htlcs_argUnwrapped, update_fail_malformed_htlcs_arg: update_fail_malformed_htlcs_argUnwrapped, update_fee_arg: update_fee_arg, commitment_signed_arg: commitment_signed_arg);
    }

    public func get_update_add_htlcs() -> [UpdateAddHTLC] {
    	
        return Bindings.LDKCVec_UpdateAddHTLCZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_update_add_htlcs(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							UpdateAddHTLC(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_update_add_htlcs(val: [UpdateAddHTLC]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_update_add_htlcs(val: valUnwrapped);
    }

    internal func set_update_add_htlcs(val: [LDKUpdateAddHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateAddHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_add_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_update_fulfill_htlcs() -> [UpdateFulfillHTLC] {
    	
        return Bindings.LDKCVec_UpdateFulfillHTLCZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_update_fulfill_htlcs(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							UpdateFulfillHTLC(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_update_fulfill_htlcs(val: [UpdateFulfillHTLC]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_update_fulfill_htlcs(val: valUnwrapped);
    }

    internal func set_update_fulfill_htlcs(val: [LDKUpdateFulfillHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateFulfillHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_fulfill_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_update_fail_htlcs() -> [UpdateFailHTLC] {
    	
        return Bindings.LDKCVec_UpdateFailHTLCZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_update_fail_htlcs(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							UpdateFailHTLC(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_update_fail_htlcs(val: [UpdateFailHTLC]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_update_fail_htlcs(val: valUnwrapped);
    }

    internal func set_update_fail_htlcs(val: [LDKUpdateFailHTLC]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_UpdateFailHTLCZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return CommitmentUpdate_set_update_fail_htlcs(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_update_fail_malformed_htlcs() -> [UpdateFailMalformedHTLC] {
    	
        return Bindings.LDKCVec_UpdateFailMalformedHTLCZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentUpdate>) in
CommitmentUpdate_get_update_fail_malformed_htlcs(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							UpdateFailMalformedHTLC(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_update_fail_malformed_htlcs(val: [UpdateFailMalformedHTLC]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_update_fail_malformed_htlcs(val: valUnwrapped);
    }

    internal func set_update_fail_malformed_htlcs(val: [LDKUpdateFailMalformedHTLC]) -> Void {
    	
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
							Bindings.print("Freeing CommitmentUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CommitmentUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

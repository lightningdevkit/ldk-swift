public class CounterpartyCommitmentSecrets: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCounterpartyCommitmentSecrets?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = CounterpartyCommitmentSecrets_new()
        super.init(conflictAvoidingVariableName: 0)
        /* POST_INIT_ANCHORING */
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCounterpartyCommitmentSecrets){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCounterpartyCommitmentSecrets, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> CounterpartyCommitmentSecrets {
    	
        return CounterpartyCommitmentSecrets(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
CounterpartyCommitmentSecrets_clone(origPointer)
});
    }

					internal func danglingClone() -> CounterpartyCommitmentSecrets {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func get_min_seen_secret() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
CounterpartyCommitmentSecrets_get_min_seen_secret(this_argPointer)
};
    }

    public func provide_secret(idx: UInt64, secret: [UInt8]) -> Result_NoneNoneZ {
    	
							let this_argPointer = UnsafeMutablePointer<LDKCounterpartyCommitmentSecrets>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return Result_NoneNoneZ(pointer: CounterpartyCommitmentSecrets_provide_secret(this_argPointer, idx, Bindings.new_LDKThirtyTwoBytes(array: secret)));
    }

    public func get_secret(idx: UInt64) -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
CounterpartyCommitmentSecrets_get_secret(this_argPointer, idx)
});
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
CounterpartyCommitmentSecrets_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_CounterpartyCommitmentSecretsDecodeErrorZ(pointer: CounterpartyCommitmentSecrets_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CounterpartyCommitmentSecrets_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> CounterpartyCommitmentSecrets {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing CounterpartyCommitmentSecrets \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing CounterpartyCommitmentSecrets \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

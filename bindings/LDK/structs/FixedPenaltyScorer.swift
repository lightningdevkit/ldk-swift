public class FixedPenaltyScorer: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKFixedPenaltyScorer?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(penalty_msat: UInt64) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = FixedPenaltyScorer_with_penalty(penalty_msat)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFixedPenaltyScorer){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKFixedPenaltyScorer, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> FixedPenaltyScorer {
    	
        return FixedPenaltyScorer(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
FixedPenaltyScorer_clone(origPointer)
});
    }

					internal func danglingClone() -> FixedPenaltyScorer {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func as_Score() -> NativelyImplementedScore {
    	
        return NativelyImplementedScore(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
FixedPenaltyScorer_as_Score(this_argPointer)
}, anchor: self);
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKFixedPenaltyScorer>) in
FixedPenaltyScorer_write(objPointer)
});
    }

    public class func read(ser: [UInt8], arg: UInt64) -> Result_FixedPenaltyScorerDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_FixedPenaltyScorerDecodeErrorZ(pointer: FixedPenaltyScorer_read(serWrapper.cOpaqueStruct!, arg));
    }

    internal func free() -> Void {
    	
        return FixedPenaltyScorer_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> FixedPenaltyScorer {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing FixedPenaltyScorer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FixedPenaltyScorer \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

public class Scorer: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKScorer?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Scorer_default()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKScorer){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKScorer, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func as_Score() -> NativelyImplementedScore {
    	
        return NativelyImplementedScore(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKScorer>) in
Scorer_as_Score(this_argPointer)
}, anchor: self);
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKScorer>) in
Scorer_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ScorerDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ScorerDecodeErrorZ(pointer: Scorer_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Scorer_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Scorer {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Scorer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Scorer \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

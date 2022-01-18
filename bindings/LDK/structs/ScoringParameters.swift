public class ScoringParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKScoringParameters?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ScoringParameters_default()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKScoringParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKScoringParameters, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_base_penalty_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_get_base_penalty_msat(this_ptrPointer)
};
    }

    public func set_base_penalty_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKScoringParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ScoringParameters_set_base_penalty_msat(this_ptrPointer, val);
    }

    public func get_failure_penalty_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_get_failure_penalty_msat(this_ptrPointer)
};
    }

    public func set_failure_penalty_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKScoringParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ScoringParameters_set_failure_penalty_msat(this_ptrPointer, val);
    }

    public func get_overuse_penalty_start_1024th() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_get_overuse_penalty_start_1024th(this_ptrPointer)
};
    }

    public func set_overuse_penalty_start_1024th(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKScoringParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ScoringParameters_set_overuse_penalty_start_1024th(this_ptrPointer, val);
    }

    public func get_overuse_penalty_msat_per_1024th() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_get_overuse_penalty_msat_per_1024th(this_ptrPointer)
};
    }

    public func set_overuse_penalty_msat_per_1024th(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKScoringParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ScoringParameters_set_overuse_penalty_msat_per_1024th(this_ptrPointer, val);
    }

    public func get_failure_penalty_half_life() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_get_failure_penalty_half_life(this_ptrPointer)
};
    }

    public func set_failure_penalty_half_life(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKScoringParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ScoringParameters_set_failure_penalty_half_life(this_ptrPointer, val);
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKScoringParameters>) in
ScoringParameters_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) throws -> ScoringParameters {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return try Result_ScoringParametersDecodeErrorZ(pointer: ScoringParameters_read(serWrapper.cOpaqueStruct!)).getValue();
    }

    internal func free() -> Void {
    	
        return ScoringParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ScoringParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ScoringParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ScoringParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

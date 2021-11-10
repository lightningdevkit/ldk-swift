public class RetryAttempts: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRetryAttempts?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(a_arg: UInt) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = RetryAttempts_new(a_arg)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRetryAttempts){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRetryAttempts, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_a() -> UInt {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRetryAttempts>) in
RetryAttempts_get_a(this_ptrPointer)
};
    }

    public func set_a(val: UInt) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRetryAttempts>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RetryAttempts_set_a(this_ptrPointer, val);
    }

    public func clone() -> RetryAttempts {
    	
        return RetryAttempts(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRetryAttempts>) in
RetryAttempts_clone(origPointer)
});
    }

					internal func danglingClone() -> RetryAttempts {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func eq(a: RetryAttempts, b: RetryAttempts) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRetryAttempts>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRetryAttempts>) in
RetryAttempts_eq(aPointer, bPointer)
}
};
    }

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKRetryAttempts>) in
RetryAttempts_hash(oPointer)
};
    }

    internal func free() -> Void {
    	
        return RetryAttempts_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RetryAttempts {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RetryAttempts \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RetryAttempts \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

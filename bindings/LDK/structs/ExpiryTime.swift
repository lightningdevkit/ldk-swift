public class ExpiryTime: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKExpiryTime?


	

    public init(pointer: LDKExpiryTime){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKExpiryTime, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> ExpiryTime {
    	
        return ExpiryTime(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_clone(origPointer)
});
    }

					internal func danglingClone() -> ExpiryTime {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_hash(oPointer)
};
    }

    public class func eq(a: ExpiryTime, b: ExpiryTime) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKExpiryTime>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_eq(aPointer, bPointer)
}
};
    }

    public class func from_seconds(seconds: UInt64) throws -> ExpiryTime {
    	
        return try Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_seconds(seconds)).getValue();
    }

    public class func from_duration(duration: UInt64) throws -> ExpiryTime {
    	
        return try Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_duration(duration)).getValue();
    }

    public func as_seconds() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_seconds(this_argPointer)
};
    }

    public func as_duration() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_duration(this_argPointer)
};
    }

    internal func free() -> Void {
    	
        return ExpiryTime_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ExpiryTime {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ExpiryTime \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ExpiryTime \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

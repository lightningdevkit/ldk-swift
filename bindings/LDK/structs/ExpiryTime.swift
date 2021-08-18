public class ExpiryTime {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKExpiryTime?;


	

    public init(pointer: LDKExpiryTime){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: ExpiryTime, b: ExpiryTime) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKExpiryTime>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> ExpiryTime {
    	
        return ExpiryTime(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_clone(origPointer)
});
    }

    public class func from_seconds(seconds: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_seconds(seconds));
    }

    public class func from_duration(duration: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_duration(duration));
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

				
	deinit {
					
					
					
		ExpiryTime_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

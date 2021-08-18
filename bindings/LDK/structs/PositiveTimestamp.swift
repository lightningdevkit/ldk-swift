public class PositiveTimestamp {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPositiveTimestamp?;


	

    public init(pointer: LDKPositiveTimestamp){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: PositiveTimestamp, b: PositiveTimestamp) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPositiveTimestamp>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPositiveTimestamp>) in
PositiveTimestamp_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> PositiveTimestamp {
    	
        return PositiveTimestamp(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPositiveTimestamp>) in
PositiveTimestamp_clone(origPointer)
});
    }

					internal func danglingClone() -> PositiveTimestamp {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func from_unix_timestamp(unix_seconds: UInt64) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: PositiveTimestamp_from_unix_timestamp(unix_seconds));
    }

    public class func from_system_time(time: UInt64) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: PositiveTimestamp_from_system_time(time));
    }

    public func as_unix_timestamp() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPositiveTimestamp>) in
PositiveTimestamp_as_unix_timestamp(this_argPointer)
};
    }

    public func as_time() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKPositiveTimestamp>) in
PositiveTimestamp_as_time(this_argPointer)
};
    }

    internal func free() -> Void {
    	
        return PositiveTimestamp_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PositiveTimestamp {
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

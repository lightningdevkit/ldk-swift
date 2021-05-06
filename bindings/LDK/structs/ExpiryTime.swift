public class ExpiryTime {

    var cOpaqueStruct: LDKExpiryTime?;

	

    public init(pointer: LDKExpiryTime){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: ExpiryTime) -> ExpiryTime {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime(pointer: ExpiryTime_clone(origPointer))
};
    }

    public func from_seconds(seconds: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_seconds(seconds));
    }

    public func from_duration(duration: UInt64) -> Result_ExpiryTimeCreationErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_ExpiryTimeCreationErrorZ(pointer: ExpiryTime_from_duration(duration));
    }

    public func as_seconds(this_arg: ExpiryTime) -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_seconds(this_argPointer)
};
    }

    public func as_duration(this_arg: ExpiryTime) -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKExpiryTime>) in
ExpiryTime_as_duration(this_argPointer)
};
    }

				
	deinit {
					
					
		ExpiryTime_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

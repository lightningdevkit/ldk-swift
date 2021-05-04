class PositiveTimestamp {

    var cOpaqueStruct: LDKPositiveTimestamp?;

	

    init(pointer: LDKPositiveTimestamp){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: PositiveTimestamp) -> PositiveTimestamp {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPositiveTimestamp>) in
							
			pointer
						
		}
					
        return PositiveTimestamp(pointer: PositiveTimestamp_clone(origPointer));
    }

    func from_unix_timestamp(unix_seconds: UInt64) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: PositiveTimestamp_from_unix_timestamp(unix_seconds));
    }

    func from_system_time(time: UInt64) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: PositiveTimestamp_from_system_time(time));
    }

    func as_unix_timestamp(this_arg: PositiveTimestamp) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPositiveTimestamp>) in
							
			pointer
						
		}
					
        return PositiveTimestamp_as_unix_timestamp(this_argPointer);
    }

    func as_time(this_arg: PositiveTimestamp) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPositiveTimestamp>) in
							
			pointer
						
		}
					
        return PositiveTimestamp_as_time(this_argPointer);
    }

				
	deinit {
					
					
		PositiveTimestamp_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

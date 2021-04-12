class MonitorUpdateError {

    var cOpaqueStruct: LDKMonitorUpdateError?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKMonitorUpdateError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: MonitorUpdateError) -> MonitorUpdateError {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMonitorUpdateError>) in
							
			pointer
						
		}
					
        return MonitorUpdateError(pointer: MonitorUpdateError_clone(origPointer));
    }

				
	deinit {
					
					
		MonitorUpdateError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

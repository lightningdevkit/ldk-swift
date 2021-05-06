public class MonitorUpdateError {

    var cOpaqueStruct: LDKMonitorUpdateError?;

	

    public init(pointer: LDKMonitorUpdateError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: MonitorUpdateError) -> MonitorUpdateError {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError(pointer: MonitorUpdateError_clone(origPointer))
};
    }

				
	deinit {
					
					
		MonitorUpdateError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

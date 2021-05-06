public class MonitorUpdateError {

    var cOpaqueStruct: LDKMonitorUpdateError?;

	

    public init(pointer: LDKMonitorUpdateError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: MonitorUpdateError) -> MonitorUpdateError {
    	
						
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

public class MonitorUpdateError {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKMonitorUpdateError?;


	

    public init(pointer: LDKMonitorUpdateError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> MonitorUpdateError {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError(pointer: MonitorUpdateError_clone(origPointer))
};
    }

				
	deinit {
					
					
					
		MonitorUpdateError_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

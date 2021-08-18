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
    	
        return MonitorUpdateError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError_clone(origPointer)
});
    }

					internal func danglingClone() -> MonitorUpdateError {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return MonitorUpdateError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MonitorUpdateError {
        				self.dangling = true
						return self
					}
					
					deinit {
						self.free()
					}
				

    /* STRUCT_METHODS_END */

}

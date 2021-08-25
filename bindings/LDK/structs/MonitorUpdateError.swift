public class MonitorUpdateError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKMonitorUpdateError?


	

    public init(pointer: LDKMonitorUpdateError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> MonitorUpdateError {
    	
        return MonitorUpdateError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError_clone(origPointer)
});
    }

					internal func danglingClone() -> MonitorUpdateError {
        				let dangledClone = self.clone()
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
						if !self.dangling {
							print("Freeing MonitorUpdateError \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing MonitorUpdateError \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

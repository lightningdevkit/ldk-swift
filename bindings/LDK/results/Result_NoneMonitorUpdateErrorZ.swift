public class Result_NoneMonitorUpdateErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NoneMonitorUpdateErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneMonitorUpdateErrorZ(contents: LDKCResult_NoneMonitorUpdateErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneMonitorUpdateErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> MonitorUpdateError? {
				if self.cOpaqueStruct?.result_ok == false {
					return MonitorUpdateError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    public class func ok() -> Result_NoneMonitorUpdateErrorZ {
    	
        return Result_NoneMonitorUpdateErrorZ(pointer: CResult_NoneMonitorUpdateErrorZ_ok());
    }

    public class func err(e: MonitorUpdateError) -> Result_NoneMonitorUpdateErrorZ {
    	
        return Result_NoneMonitorUpdateErrorZ(pointer: CResult_NoneMonitorUpdateErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NoneMonitorUpdateErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneMonitorUpdateErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_NoneMonitorUpdateErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_NoneMonitorUpdateErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NoneMonitorUpdateErrorZ {
    	
        return Result_NoneMonitorUpdateErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneMonitorUpdateErrorZ>) in
CResult_NoneMonitorUpdateErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneMonitorUpdateErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

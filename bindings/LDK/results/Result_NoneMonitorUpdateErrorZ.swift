public class Result_NoneMonitorUpdateErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneMonitorUpdateErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneMonitorUpdateErrorZ(contents: LDKCResult_NoneMonitorUpdateErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneMonitorUpdateErrorZ){
		self.cOpaqueStruct = pointer
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
			
    /* RESULT_METHODS_END */

}

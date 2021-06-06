public class Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(contents: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKIOError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

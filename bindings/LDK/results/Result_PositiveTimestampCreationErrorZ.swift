public class Result_PositiveTimestampCreationErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_PositiveTimestampCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PositiveTimestampCreationErrorZ(contents: LDKCResult_PositiveTimestampCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PositiveTimestampCreationErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> PositiveTimestamp? {
				if self.cOpaqueStruct?.result_ok == true {
					return PositiveTimestamp(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

public class Result_NoneErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneErrorZ(contents: LDKCResult_NoneErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneErrorZ){
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

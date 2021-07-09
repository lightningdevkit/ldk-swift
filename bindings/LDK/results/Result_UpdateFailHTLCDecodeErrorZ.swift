public class Result_UpdateFailHTLCDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_UpdateFailHTLCDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_UpdateFailHTLCDecodeErrorZ(contents: LDKCResult_UpdateFailHTLCDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UpdateFailHTLCDecodeErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> UpdateFailHTLC? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateFailHTLC(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

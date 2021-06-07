public class Result_UpdateFulfillHTLCDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_UpdateFulfillHTLCDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_UpdateFulfillHTLCDecodeErrorZ(contents: LDKCResult_UpdateFulfillHTLCDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UpdateFulfillHTLCDecodeErrorZ){
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
			
			public func getValue() -> UpdateFulfillHTLC? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateFulfillHTLC(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

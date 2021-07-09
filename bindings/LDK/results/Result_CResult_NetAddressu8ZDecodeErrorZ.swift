public class Result_CResult_NetAddressu8ZDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CResult_NetAddressu8ZDecodeErrorZ(contents: LDKCResult_CResult_NetAddressu8ZDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ){
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
			
			public func getValue() -> Result_NetAddressu8Z? {
				if self.cOpaqueStruct?.result_ok == true {
					return Result_NetAddressu8Z(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

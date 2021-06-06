public class Result_CVec_SignatureZNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_SignatureZNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_SignatureZNoneZ(contents: LDKCResult_CVec_SignatureZNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_SignatureZNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

    /* RESULT_METHODS_END */

}

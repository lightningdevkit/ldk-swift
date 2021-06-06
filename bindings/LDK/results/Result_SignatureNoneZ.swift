public class Result_SignatureNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SignatureNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SignatureNoneZ(contents: LDKCResult_SignatureNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignatureNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

    /* RESULT_METHODS_END */

}

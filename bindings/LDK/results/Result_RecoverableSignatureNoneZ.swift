public class Result_RecoverableSignatureNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_RecoverableSignatureNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_RecoverableSignatureNoneZ(contents: LDKCResult_RecoverableSignatureNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RecoverableSignatureNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

    /* RESULT_METHODS_END */

}

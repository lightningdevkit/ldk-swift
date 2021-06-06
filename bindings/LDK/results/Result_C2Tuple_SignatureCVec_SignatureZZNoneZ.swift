public class Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ(contents: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

    /* RESULT_METHODS_END */

}

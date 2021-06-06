public class Result_TransactionNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_TransactionNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_TransactionNoneZ(contents: LDKCResult_TransactionNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TransactionNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

    /* RESULT_METHODS_END */

}

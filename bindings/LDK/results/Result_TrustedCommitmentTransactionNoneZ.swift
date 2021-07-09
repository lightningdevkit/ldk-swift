public class Result_TrustedCommitmentTransactionNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_TrustedCommitmentTransactionNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_TrustedCommitmentTransactionNoneZ(contents: LDKCResult_TrustedCommitmentTransactionNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> TrustedCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return TrustedCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

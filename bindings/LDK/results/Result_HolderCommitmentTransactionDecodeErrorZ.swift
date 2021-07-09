public class Result_HolderCommitmentTransactionDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_HolderCommitmentTransactionDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_HolderCommitmentTransactionDecodeErrorZ(contents: LDKCResult_HolderCommitmentTransactionDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_HolderCommitmentTransactionDecodeErrorZ){
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
			
			public func getValue() -> HolderCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return HolderCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

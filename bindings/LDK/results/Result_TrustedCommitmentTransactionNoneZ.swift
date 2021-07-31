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
			
    public class func ok(o: TrustedCommitmentTransaction) -> Result_TrustedCommitmentTransactionNoneZ {
    	
        return Result_TrustedCommitmentTransactionNoneZ(pointer: CResult_TrustedCommitmentTransactionNoneZ_ok(o.cOpaqueStruct!));
    }

    public class func err() -> Result_TrustedCommitmentTransactionNoneZ {
    	
        return Result_TrustedCommitmentTransactionNoneZ(pointer: CResult_TrustedCommitmentTransactionNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_TrustedCommitmentTransactionNoneZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}

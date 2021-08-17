import LDKHeaders

public class Result_BuiltCommitmentTransactionDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_BuiltCommitmentTransactionDecodeErrorZ(contents: LDKCResult_BuiltCommitmentTransactionDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ){
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
			
			public func getValue() -> BuiltCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return BuiltCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: BuiltCommitmentTransaction) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: CResult_BuiltCommitmentTransactionDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: CResult_BuiltCommitmentTransactionDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_BuiltCommitmentTransactionDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_BuiltCommitmentTransactionDecodeErrorZ>) in
CResult_BuiltCommitmentTransactionDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

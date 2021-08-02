public class Result_FundingSignedDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_FundingSignedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_FundingSignedDecodeErrorZ(contents: LDKCResult_FundingSignedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_FundingSignedDecodeErrorZ){
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
			
			public func getValue() -> FundingSigned? {
				if self.cOpaqueStruct?.result_ok == true {
					return FundingSigned(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: FundingSigned) -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: CResult_FundingSignedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: CResult_FundingSignedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_FundingSignedDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FundingSignedDecodeErrorZ>) in
CResult_FundingSignedDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

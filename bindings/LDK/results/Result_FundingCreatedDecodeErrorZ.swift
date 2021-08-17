import LDKHeaders

public class Result_FundingCreatedDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_FundingCreatedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_FundingCreatedDecodeErrorZ(contents: LDKCResult_FundingCreatedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_FundingCreatedDecodeErrorZ){
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
			
			public func getValue() -> FundingCreated? {
				if self.cOpaqueStruct?.result_ok == true {
					return FundingCreated(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: FundingCreated) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: CResult_FundingCreatedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: CResult_FundingCreatedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_FundingCreatedDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FundingCreatedDecodeErrorZ>) in
CResult_FundingCreatedDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

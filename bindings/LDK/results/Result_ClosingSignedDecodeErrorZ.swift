public class Result_ClosingSignedDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ClosingSignedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ClosingSignedDecodeErrorZ(contents: LDKCResult_ClosingSignedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ClosingSignedDecodeErrorZ){
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
			
			public func getValue() -> ClosingSigned? {
				if self.cOpaqueStruct?.result_ok == true {
					return ClosingSigned(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ClosingSigned) -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: CResult_ClosingSignedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: CResult_ClosingSignedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ClosingSignedDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ClosingSignedDecodeErrorZ>) in
CResult_ClosingSignedDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

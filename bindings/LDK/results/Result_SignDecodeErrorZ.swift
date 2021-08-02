public class Result_SignDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SignDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SignDecodeErrorZ(contents: LDKCResult_SignDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignDecodeErrorZ){
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
			
			public func getValue() -> Sign? {
				if self.cOpaqueStruct?.result_ok == true {
					return Sign(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Sign) -> Result_SignDecodeErrorZ {
    	
        return Result_SignDecodeErrorZ(pointer: CResult_SignDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_SignDecodeErrorZ {
    	
        return Result_SignDecodeErrorZ(pointer: CResult_SignDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_SignDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_SignDecodeErrorZ {
    	
        return Result_SignDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignDecodeErrorZ>) in
CResult_SignDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

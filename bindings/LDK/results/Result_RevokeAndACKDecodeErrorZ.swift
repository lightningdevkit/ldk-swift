import LDKHeaders

public class Result_RevokeAndACKDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_RevokeAndACKDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_RevokeAndACKDecodeErrorZ(contents: LDKCResult_RevokeAndACKDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RevokeAndACKDecodeErrorZ){
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
			
			public func getValue() -> RevokeAndACK? {
				if self.cOpaqueStruct?.result_ok == true {
					return RevokeAndACK(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: RevokeAndACK) -> Result_RevokeAndACKDecodeErrorZ {
    	
        return Result_RevokeAndACKDecodeErrorZ(pointer: CResult_RevokeAndACKDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_RevokeAndACKDecodeErrorZ {
    	
        return Result_RevokeAndACKDecodeErrorZ(pointer: CResult_RevokeAndACKDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_RevokeAndACKDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_RevokeAndACKDecodeErrorZ {
    	
        return Result_RevokeAndACKDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RevokeAndACKDecodeErrorZ>) in
CResult_RevokeAndACKDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

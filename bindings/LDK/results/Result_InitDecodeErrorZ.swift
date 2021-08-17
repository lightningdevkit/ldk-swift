import LDKHeaders

public class Result_InitDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_InitDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_InitDecodeErrorZ(contents: LDKCResult_InitDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InitDecodeErrorZ){
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
			
			public func getValue() -> Init? {
				if self.cOpaqueStruct?.result_ok == true {
					return Init(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Init) -> Result_InitDecodeErrorZ {
    	
        return Result_InitDecodeErrorZ(pointer: CResult_InitDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_InitDecodeErrorZ {
    	
        return Result_InitDecodeErrorZ(pointer: CResult_InitDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_InitDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_InitDecodeErrorZ {
    	
        return Result_InitDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InitDecodeErrorZ>) in
CResult_InitDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

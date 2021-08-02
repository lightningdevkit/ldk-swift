public class Result_NoneAPIErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneAPIErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneAPIErrorZ(contents: LDKCResult_NoneAPIErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneAPIErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> APIError? {
				if self.cOpaqueStruct?.result_ok == false {
					return APIError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    public class func ok() -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: CResult_NoneAPIErrorZ_ok());
    }

    public class func err(e: APIError) -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: CResult_NoneAPIErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NoneAPIErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneAPIErrorZ>) in
CResult_NoneAPIErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

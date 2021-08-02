public class Result_NoneErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneErrorZ(contents: LDKCResult_NoneErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKIOError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
    public class func ok() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: CResult_NoneErrorZ_ok());
    }

    public class func err(e: LDKIOError) -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: CResult_NoneErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_NoneErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneErrorZ>) in
CResult_NoneErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

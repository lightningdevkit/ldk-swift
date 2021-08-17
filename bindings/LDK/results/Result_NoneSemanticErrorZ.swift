import LDKHeaders

public class Result_NoneSemanticErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneSemanticErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneSemanticErrorZ(contents: LDKCResult_NoneSemanticErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneSemanticErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKSemanticError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
    public class func ok() -> Result_NoneSemanticErrorZ {
    	
        return Result_NoneSemanticErrorZ(pointer: CResult_NoneSemanticErrorZ_ok());
    }

    public class func err(e: LDKSemanticError) -> Result_NoneSemanticErrorZ {
    	
        return Result_NoneSemanticErrorZ(pointer: CResult_NoneSemanticErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_NoneSemanticErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NoneSemanticErrorZ {
    	
        return Result_NoneSemanticErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneSemanticErrorZ>) in
CResult_NoneSemanticErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

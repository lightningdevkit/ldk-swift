import LDKHeaders

public class Result_NoneLightningErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneLightningErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneLightningErrorZ(contents: LDKCResult_NoneLightningErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneLightningErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LightningError? {
				if self.cOpaqueStruct?.result_ok == false {
					return LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    public class func ok() -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: CResult_NoneLightningErrorZ_ok());
    }

    public class func err(e: LightningError) -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: CResult_NoneLightningErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NoneLightningErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneLightningErrorZ>) in
CResult_NoneLightningErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

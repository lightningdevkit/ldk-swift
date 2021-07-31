public class Result_CVec_SignatureZNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_SignatureZNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_SignatureZNoneZ(contents: LDKCResult_CVec_SignatureZNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_SignatureZNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [[UInt8]]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKCVec_SignatureZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [[UInt8]]) -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: CResult_CVec_SignatureZNoneZ_ok(Bindings.new_LDKCVec_SignatureZ(array: o)));
    }

    public class func err() -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: CResult_CVec_SignatureZNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_CVec_SignatureZNoneZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CVec_SignatureZNoneZ>) in
CResult_CVec_SignatureZNoneZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

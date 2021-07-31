public class Result_SignatureNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SignatureNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SignatureNoneZ(contents: LDKCResult_SignatureNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignatureNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKSignature_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_SignatureNoneZ {
    	
        return Result_SignatureNoneZ(pointer: CResult_SignatureNoneZ_ok(Bindings.new_LDKSignature(array: o)));
    }

    public class func err() -> Result_SignatureNoneZ {
    	
        return Result_SignatureNoneZ(pointer: CResult_SignatureNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_SignatureNoneZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_SignatureNoneZ {
    	
        return Result_SignatureNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignatureNoneZ>) in
CResult_SignatureNoneZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

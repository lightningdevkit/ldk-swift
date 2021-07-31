public class Result_SiPrefixNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SiPrefixNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SiPrefixNoneZ(contents: LDKCResult_SiPrefixNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SiPrefixNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> LDKSiPrefix? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
    public class func ok(o: LDKSiPrefix) -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: CResult_SiPrefixNoneZ_ok(o));
    }

    public class func err() -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: CResult_SiPrefixNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_SiPrefixNoneZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SiPrefixNoneZ>) in
CResult_SiPrefixNoneZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

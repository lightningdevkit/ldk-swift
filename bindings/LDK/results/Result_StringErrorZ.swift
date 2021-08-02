public class Result_StringErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_StringErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_StringErrorZ(contents: LDKCResult_StringErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_StringErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKSecp256k1Error? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> String? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: String) -> Result_StringErrorZ {
    	
        return Result_StringErrorZ(pointer: CResult_StringErrorZ_ok(Bindings.new_LDKStr(string: o)));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_StringErrorZ {
    	
        return Result_StringErrorZ(pointer: CResult_StringErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_StringErrorZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}

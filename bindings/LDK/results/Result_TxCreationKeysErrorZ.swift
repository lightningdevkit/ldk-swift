import LDKHeaders

public class Result_TxCreationKeysErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_TxCreationKeysErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_TxCreationKeysErrorZ(contents: LDKCResult_TxCreationKeysErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TxCreationKeysErrorZ){
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
			
			public func getValue() -> TxCreationKeys? {
				if self.cOpaqueStruct?.result_ok == true {
					return TxCreationKeys(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: TxCreationKeys) -> Result_TxCreationKeysErrorZ {
    	
        return Result_TxCreationKeysErrorZ(pointer: CResult_TxCreationKeysErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_TxCreationKeysErrorZ {
    	
        return Result_TxCreationKeysErrorZ(pointer: CResult_TxCreationKeysErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_TxCreationKeysErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_TxCreationKeysErrorZ {
    	
        return Result_TxCreationKeysErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_TxCreationKeysErrorZ>) in
CResult_TxCreationKeysErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_TransactionNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_TransactionNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_TransactionNoneZ(contents: LDKCResult_TransactionNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TransactionNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKTransaction_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: CResult_TransactionNoneZ_ok(Bindings.new_LDKTransaction(array: o)));
    }

    public class func err() -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: CResult_TransactionNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_TransactionNoneZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_TransactionNoneZ>) in
CResult_TransactionNoneZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

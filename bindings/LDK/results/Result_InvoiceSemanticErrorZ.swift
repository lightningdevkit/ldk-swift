public class Result_InvoiceSemanticErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_InvoiceSemanticErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_InvoiceSemanticErrorZ(contents: LDKCResult_InvoiceSemanticErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceSemanticErrorZ){
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
			
			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Invoice) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: CResult_InvoiceSemanticErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKSemanticError) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: CResult_InvoiceSemanticErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_InvoiceSemanticErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InvoiceSemanticErrorZ>) in
CResult_InvoiceSemanticErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

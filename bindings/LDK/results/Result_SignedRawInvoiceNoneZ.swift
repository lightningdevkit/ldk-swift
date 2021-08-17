import LDKHeaders

public class Result_SignedRawInvoiceNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SignedRawInvoiceNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SignedRawInvoiceNoneZ(contents: LDKCResult_SignedRawInvoiceNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignedRawInvoiceNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> SignedRawInvoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return SignedRawInvoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: SignedRawInvoice) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: CResult_SignedRawInvoiceNoneZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err() -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: CResult_SignedRawInvoiceNoneZ_err());
    }

    public func free() -> Void {
    	
        return CResult_SignedRawInvoiceNoneZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceNoneZ>) in
CResult_SignedRawInvoiceNoneZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

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
			
    /* RESULT_METHODS_END */

}

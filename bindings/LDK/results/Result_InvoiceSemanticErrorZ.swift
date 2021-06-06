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
			
    /* RESULT_METHODS_END */

}

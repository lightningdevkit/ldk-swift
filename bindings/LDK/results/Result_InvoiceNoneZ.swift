public class Result_InvoiceNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_InvoiceNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_InvoiceNoneZ(contents: LDKCResult_InvoiceNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

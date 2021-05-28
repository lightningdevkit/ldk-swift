public class InvoiceSignature {

    public internal(set) var cOpaqueStruct: LDKInvoiceSignature?;

	

    public init(pointer: LDKInvoiceSignature){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: InvoiceSignature) -> InvoiceSignature {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature(pointer: InvoiceSignature_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		InvoiceSignature_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

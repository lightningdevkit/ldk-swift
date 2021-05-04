class C3Tuple_RawInvoice_u832InvoiceSignatureZ {

    var cOpaqueStruct: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ?;

    init(pointer: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: RawInvoice, b: [UInt8], c: InvoiceSignature) -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: C3Tuple_RawInvoice_u832InvoiceSignatureZ_new(a.cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: b), c.cOpaqueStruct!));
    }

				
	deinit {
					
					
		C3Tuple_RawInvoice_u832InvoiceSignatureZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

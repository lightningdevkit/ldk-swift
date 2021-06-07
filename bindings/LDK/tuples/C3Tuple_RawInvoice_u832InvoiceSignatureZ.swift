public class C3Tuple_RawInvoice_u832InvoiceSignatureZ {

    public internal(set) var cOpaqueStruct: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ?;

    public init(pointer: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone(orig: C3Tuple_RawInvoice_u832InvoiceSignatureZ) -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ>) in
							
			pointer
						
		}
					
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: C3Tuple_RawInvoice_u832InvoiceSignatureZ_clone(origPointer));
    }

    public func new(a: RawInvoice, b: [UInt8], c: InvoiceSignature) -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: C3Tuple_RawInvoice_u832InvoiceSignatureZ_new(a.cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: b), c.cOpaqueStruct!));
    }

				
	deinit {
					
					if self.cOpaqueStruct?.a.is_owned == true {
						return
					}
				
					if self.cOpaqueStruct?.c.is_owned == true {
						return
					}
				
					
					
		C3Tuple_RawInvoice_u832InvoiceSignatureZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

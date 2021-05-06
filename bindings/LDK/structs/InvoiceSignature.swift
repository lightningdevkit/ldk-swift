public class InvoiceSignature {

    var cOpaqueStruct: LDKInvoiceSignature?;

	

    public init(pointer: LDKInvoiceSignature){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: InvoiceSignature) -> InvoiceSignature {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoiceSignature>) in
							
			pointer
						
		}
					
        return InvoiceSignature(pointer: InvoiceSignature_clone(origPointer));
    }

				
	deinit {
					
					
		InvoiceSignature_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

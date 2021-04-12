class InvoiceFeatures {

    var cOpaqueStruct: LDKInvoiceFeatures?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = InvoiceFeatures_known()
    }

    private init(pointer: LDKInvoiceFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: InvoiceFeatures) -> InvoiceFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoiceFeatures>) in
							
			pointer
						
		}
					
        return InvoiceFeatures(pointer: InvoiceFeatures_clone(origPointer));
    }

    func write(obj: InvoiceFeatures) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoiceFeatures>) in
							
			pointer
						
		}
					
        return InvoiceFeatures_write(objPointer);
    }

    func read(ser: [U]) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
        return InvoiceFeatures_read(ser);
    }

				
	deinit {
					
					
		InvoiceFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

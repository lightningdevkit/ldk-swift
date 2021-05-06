public class InvoiceFeatures {

    var cOpaqueStruct: LDKInvoiceFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = InvoiceFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvoiceFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: InvoiceFeatures) -> InvoiceFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoiceFeatures>) in
							
			pointer
						
		}
					
        return InvoiceFeatures(pointer: InvoiceFeatures_clone(origPointer));
    }

    public func write(obj: InvoiceFeatures) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoiceFeatures>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: InvoiceFeatures_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
        return Result_InvoiceFeaturesDecodeErrorZ(pointer: InvoiceFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		InvoiceFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

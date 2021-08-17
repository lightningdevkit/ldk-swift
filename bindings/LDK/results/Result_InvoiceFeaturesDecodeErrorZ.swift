import LDKHeaders

public class Result_InvoiceFeaturesDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_InvoiceFeaturesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_InvoiceFeaturesDecodeErrorZ(contents: LDKCResult_InvoiceFeaturesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceFeaturesDecodeErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> InvoiceFeatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return InvoiceFeatures(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: InvoiceFeatures) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
        return Result_InvoiceFeaturesDecodeErrorZ(pointer: CResult_InvoiceFeaturesDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
        return Result_InvoiceFeaturesDecodeErrorZ(pointer: CResult_InvoiceFeaturesDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_InvoiceFeaturesDecodeErrorZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_NonePaymentSendFailureZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NonePaymentSendFailureZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NonePaymentSendFailureZ(contents: LDKCResult_NonePaymentSendFailureZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NonePaymentSendFailureZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> PaymentSendFailure? {
				if self.cOpaqueStruct?.result_ok == false {
					return PaymentSendFailure(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    public class func ok() -> Result_NonePaymentSendFailureZ {
    	
        return Result_NonePaymentSendFailureZ(pointer: CResult_NonePaymentSendFailureZ_ok());
    }

    public class func err(e: PaymentSendFailure) -> Result_NonePaymentSendFailureZ {
    	
        return Result_NonePaymentSendFailureZ(pointer: CResult_NonePaymentSendFailureZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NonePaymentSendFailureZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NonePaymentSendFailureZ {
    	
        return Result_NonePaymentSendFailureZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NonePaymentSendFailureZ>) in
CResult_NonePaymentSendFailureZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

public class Result_PaymentHashPaymentSendFailureZ {

    public internal(set) var cOpaqueStruct: LDKCResult_PaymentHashPaymentSendFailureZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PaymentHashPaymentSendFailureZ(contents: LDKCResult_PaymentHashPaymentSendFailureZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PaymentHashPaymentSendFailureZ){
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
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: CResult_PaymentHashPaymentSendFailureZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
    }

    public class func err(e: PaymentSendFailure) -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: CResult_PaymentHashPaymentSendFailureZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_PaymentHashPaymentSendFailureZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentHashPaymentSendFailureZ>) in
CResult_PaymentHashPaymentSendFailureZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

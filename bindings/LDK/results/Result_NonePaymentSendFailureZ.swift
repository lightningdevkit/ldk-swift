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
			
    /* RESULT_METHODS_END */

}

public class C2Tuple_PaymentHashPaymentSecretZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_PaymentHashPaymentSecretZ?;

    public init(pointer: LDKC2Tuple_PaymentHashPaymentSecretZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func new(a: [UInt8], b: [UInt8]) -> C2Tuple_PaymentHashPaymentSecretZ {
    	
        return C2Tuple_PaymentHashPaymentSecretZ(pointer: C2Tuple_PaymentHashPaymentSecretZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKThirtyTwoBytes(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_PaymentHashPaymentSecretZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

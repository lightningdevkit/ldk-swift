public class PaymentPurpose {

    public internal(set) var cOpaqueStruct: LDKPaymentPurpose?;

	

    public init(pointer: LDKPaymentPurpose){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum PaymentPurposeValueType {
					case InvoicePayment, SpontaneousPayment
				}
				
				public func getValueType() -> PaymentPurposeValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKPaymentPurpose_InvoicePayment:
						return .InvoicePayment
					case LDKPaymentPurpose_SpontaneousPayment:
						return .SpontaneousPayment
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsInvoicePayment() -> InvoicePayment? {
						if self.cOpaqueStruct?.tag != LDKPaymentPurpose_InvoicePayment {
							return nil
						}
						return InvoicePayment(pointer: self.cOpaqueStruct!.invoice_payment)
					}
				
					public func getValueAsSpontaneousPayment() -> [UInt8]? {
						if self.cOpaqueStruct?.tag != LDKPaymentPurpose_SpontaneousPayment {
							return nil
						}
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.spontaneous_payment)
					}
				
			
    public func free() -> Void {
    	
        return PaymentPurpose_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> PaymentPurpose {
    	
        return PaymentPurpose(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentPurpose>) in
PaymentPurpose_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	

			public class InvoicePayment {
				
				
				var cOpaqueStruct: LDKPaymentPurpose_LDKInvoicePayment_Body?;
				fileprivate init(pointer: LDKPaymentPurpose_LDKInvoicePayment_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getPayment_preimage() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_preimage)
					}
				
					public func getPayment_secret() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_secret)
					}
				
					public func getUser_payment_id() -> UInt64 {
						return self.cOpaqueStruct!.user_payment_id
					}
				
				
			}
		
}

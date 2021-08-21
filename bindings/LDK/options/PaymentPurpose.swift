public class PaymentPurpose: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKPaymentPurpose?

	

    public init(pointer: LDKPaymentPurpose){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
				
			
    internal func free() -> Void {
    	
        return PaymentPurpose_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PaymentPurpose {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing PaymentPurpose \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing PaymentPurpose \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> PaymentPurpose {
    	
        return PaymentPurpose(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentPurpose>) in
PaymentPurpose_clone(origPointer)
});
    }

					internal func danglingClone() -> PaymentPurpose {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func invoice_payment(payment_preimage: [UInt8], payment_secret: [UInt8], user_payment_id: UInt64) -> PaymentPurpose {
    	
        return PaymentPurpose(pointer: PaymentPurpose_invoice_payment(Bindings.new_LDKThirtyTwoBytes(array: payment_preimage), Bindings.new_LDKThirtyTwoBytes(array: payment_secret), user_payment_id));
    }

    public class func spontaneous_payment(a: [UInt8]) -> PaymentPurpose {
    	
        return PaymentPurpose(pointer: PaymentPurpose_spontaneous_payment(Bindings.new_LDKThirtyTwoBytes(array: a)));
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

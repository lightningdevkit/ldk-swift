#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class PaymentError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPaymentError?

	

    public init(pointer: LDKPaymentError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPaymentError, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum PaymentErrorValueType {
					case Invoice, Routing, Sending
				}
				
				public func getValueType() -> PaymentErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKPaymentError_Invoice:
						return .Invoice
					case LDKPaymentError_Routing:
						return .Routing
					case LDKPaymentError_Sending:
						return .Sending
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsInvoice() -> String? {
						if self.cOpaqueStruct?.tag != LDKPaymentError_Invoice {
							return nil
						}
						return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.invoice)
					}
				
					public func getValueAsRouting() -> LightningError? {
						if self.cOpaqueStruct?.tag != LDKPaymentError_Routing {
							return nil
						}
						return LightningError(pointer: self.cOpaqueStruct!.routing, anchor: self)
					}
				
					public func getValueAsSending() -> PaymentSendFailure? {
						if self.cOpaqueStruct?.tag != LDKPaymentError_Sending {
							return nil
						}
						return PaymentSendFailure(pointer: self.cOpaqueStruct!.sending, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return PaymentError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PaymentError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentError \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> PaymentError {
    	
        return PaymentError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentError>) in
PaymentError_clone(origPointer)
});
    }

					internal func danglingClone() -> PaymentError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func invoice(a: String) -> PaymentError {
    	
        return PaymentError(pointer: PaymentError_invoice(Bindings.new_LDKStr(string: a, chars_is_owned: true)));
    }

    public class func routing(a: LightningError) -> PaymentError {
    	
        return PaymentError(pointer: PaymentError_routing(a.danglingClone().cOpaqueStruct!));
    }

    public class func sending(a: PaymentSendFailure) -> PaymentError {
    	
        return PaymentError(pointer: PaymentError_sending(a.danglingClone().cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}

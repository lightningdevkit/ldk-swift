#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_PaymentIdPaymentSendFailureZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_PaymentIdPaymentSendFailureZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentIdPaymentSendFailureZ(contents: LDKCResult_PaymentIdPaymentSendFailureZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PaymentIdPaymentSendFailureZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_PaymentIdPaymentSendFailureZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> PaymentSendFailure? {
				if self.cOpaqueStruct?.result_ok == false {
					return PaymentSendFailure(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_PaymentIdPaymentSendFailureZ {
    	
        return Result_PaymentIdPaymentSendFailureZ(pointer: CResult_PaymentIdPaymentSendFailureZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
    }

    public class func err(e: PaymentSendFailure) -> Result_PaymentIdPaymentSendFailureZ {
    	
        return Result_PaymentIdPaymentSendFailureZ(pointer: CResult_PaymentIdPaymentSendFailureZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_PaymentIdPaymentSendFailureZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PaymentIdPaymentSendFailureZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentIdPaymentSendFailureZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentIdPaymentSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PaymentIdPaymentSendFailureZ {
    	
        return Result_PaymentIdPaymentSendFailureZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentIdPaymentSendFailureZ>) in
CResult_PaymentIdPaymentSendFailureZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PaymentIdPaymentSendFailureZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

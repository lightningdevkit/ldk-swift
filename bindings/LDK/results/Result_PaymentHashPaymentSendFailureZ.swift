public class Result_PaymentHashPaymentSendFailureZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_PaymentHashPaymentSendFailureZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentHashPaymentSendFailureZ(contents: LDKCResult_PaymentHashPaymentSendFailureZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PaymentHashPaymentSendFailureZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_PaymentHashPaymentSendFailureZ, anchor: NativeTypeWrapper){
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
			
    public class func ok(o: [UInt8]) -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: CResult_PaymentHashPaymentSendFailureZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
    }

    public class func err(e: PaymentSendFailure) -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: CResult_PaymentHashPaymentSendFailureZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_PaymentHashPaymentSendFailureZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PaymentHashPaymentSendFailureZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentHashPaymentSendFailureZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentHashPaymentSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PaymentHashPaymentSendFailureZ {
    	
        return Result_PaymentHashPaymentSendFailureZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentHashPaymentSendFailureZ>) in
CResult_PaymentHashPaymentSendFailureZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PaymentHashPaymentSendFailureZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

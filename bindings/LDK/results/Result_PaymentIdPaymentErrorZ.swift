public class Result_PaymentIdPaymentErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_PaymentIdPaymentErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentIdPaymentErrorZ(contents: LDKCResult_PaymentIdPaymentErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PaymentIdPaymentErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_PaymentIdPaymentErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> PaymentError? {
				if self.cOpaqueStruct?.result_ok == false {
					return PaymentError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: CResult_PaymentIdPaymentErrorZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
    }

    public class func err(e: PaymentError) -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: CResult_PaymentIdPaymentErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_PaymentIdPaymentErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PaymentIdPaymentErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentIdPaymentErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentIdPaymentErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PaymentIdPaymentErrorZ {
    	
        return Result_PaymentIdPaymentErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentIdPaymentErrorZ>) in
CResult_PaymentIdPaymentErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PaymentIdPaymentErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

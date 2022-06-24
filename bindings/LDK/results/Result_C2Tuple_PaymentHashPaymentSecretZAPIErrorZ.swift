#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(contents: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> APIError? {
				if self.cOpaqueStruct?.result_ok == false {
					return APIError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> C2Tuple_PaymentHashPaymentSecretZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_PaymentHashPaymentSecretZ(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_PaymentHashPaymentSecretZ) -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(pointer: CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: APIError) -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(pointer: CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ>) in
CResult_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_C2Tuple_PaymentHashPaymentSecretZAPIErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

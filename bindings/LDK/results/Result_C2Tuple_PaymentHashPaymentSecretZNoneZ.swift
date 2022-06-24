#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_C2Tuple_PaymentHashPaymentSecretZNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ(contents: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> C2Tuple_PaymentHashPaymentSecretZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_PaymentHashPaymentSecretZ(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_PaymentHashPaymentSecretZ) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(pointer: CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(pointer: CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_PaymentHashPaymentSecretZNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_PaymentHashPaymentSecretZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
    	
        return Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ>) in
CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

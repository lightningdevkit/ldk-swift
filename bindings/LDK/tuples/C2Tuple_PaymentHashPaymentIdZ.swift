public class C2Tuple_PaymentHashPaymentIdZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_PaymentHashPaymentIdZ?

    public init(pointer: LDKC2Tuple_PaymentHashPaymentIdZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_PaymentHashPaymentIdZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_PaymentHashPaymentIdZ {
    	
        return C2Tuple_PaymentHashPaymentIdZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_PaymentHashPaymentIdZ>) in
C2Tuple_PaymentHashPaymentIdZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_PaymentHashPaymentIdZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [UInt8]) -> C2Tuple_PaymentHashPaymentIdZ {
    	
        return C2Tuple_PaymentHashPaymentIdZ(pointer: C2Tuple_PaymentHashPaymentIdZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKThirtyTwoBytes(array: b)));
    }

    internal func free() -> Void {
    	
        return C2Tuple_PaymentHashPaymentIdZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_PaymentHashPaymentIdZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_PaymentHashPaymentIdZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_PaymentHashPaymentIdZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.b);
				}
			
    /* TUPLE_METHODS_END */

}

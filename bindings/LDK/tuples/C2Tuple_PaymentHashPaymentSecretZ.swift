public class C2Tuple_PaymentHashPaymentSecretZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_PaymentHashPaymentSecretZ?;

    public init(pointer: LDKC2Tuple_PaymentHashPaymentSecretZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_PaymentHashPaymentSecretZ {
    	
        return C2Tuple_PaymentHashPaymentSecretZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_PaymentHashPaymentSecretZ>) in
C2Tuple_PaymentHashPaymentSecretZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_PaymentHashPaymentSecretZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [UInt8]) -> C2Tuple_PaymentHashPaymentSecretZ {
    	
        return C2Tuple_PaymentHashPaymentSecretZ(pointer: C2Tuple_PaymentHashPaymentSecretZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKThirtyTwoBytes(array: b)));
    }

    internal func free() -> Void {
    	
        return C2Tuple_PaymentHashPaymentSecretZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_PaymentHashPaymentSecretZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}

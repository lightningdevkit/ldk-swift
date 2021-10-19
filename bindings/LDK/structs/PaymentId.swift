public class PaymentId: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPaymentId?


	

    public init(pointer: LDKPaymentId){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPaymentId, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKPaymentId>) in
PaymentId_hash(oPointer)
};
    }

    public func clone() -> PaymentId {
    	
        return PaymentId(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPaymentId>) in
PaymentId_clone(origPointer)
});
    }

					internal func danglingClone() -> PaymentId {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func eq(a: PaymentId, b: PaymentId) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPaymentId>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPaymentId>) in
PaymentId_eq(aPointer, bPointer)
}
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPaymentId>) in
PaymentId_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PaymentIdDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_PaymentIdDecodeErrorZ(pointer: PaymentId_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return PaymentId_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PaymentId {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PaymentId \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PaymentId \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

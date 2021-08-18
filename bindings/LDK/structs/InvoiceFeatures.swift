public class InvoiceFeatures {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKInvoiceFeatures?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = InvoiceFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvoiceFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: InvoiceFeatures, b: InvoiceFeatures) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInvoiceFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> InvoiceFeatures {
    	
        return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_clone(origPointer)
});
    }

					internal func danglingClone() -> InvoiceFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func supports_payment_secret() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_supports_payment_secret(this_argPointer)
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
        return Result_InvoiceFeaturesDecodeErrorZ(pointer: InvoiceFeatures_read(Bindings.new_LDKu8slice(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return InvoiceFeatures_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> InvoiceFeatures {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing InvoiceFeatures \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing InvoiceFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

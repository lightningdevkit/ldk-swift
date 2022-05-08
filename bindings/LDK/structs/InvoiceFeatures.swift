public class InvoiceFeatures: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKInvoiceFeatures?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = InvoiceFeatures_known()
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvoiceFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKInvoiceFeatures, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
				

    public func requires_unknown_bits() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_requires_unknown_bits(this_argPointer)
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_InvoiceFeaturesDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_InvoiceFeaturesDecodeErrorZ(pointer: InvoiceFeatures_read(serWrapper.cOpaqueStruct!));
    }

    public func set_variable_length_onion_optional() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_variable_length_onion_optional(this_argPointer);
    }

    public func set_variable_length_onion_required() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_variable_length_onion_required(this_argPointer);
    }

    public func supports_variable_length_onion() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_supports_variable_length_onion(this_argPointer)
};
    }

    public func requires_variable_length_onion() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_requires_variable_length_onion(this_argPointer)
};
    }

    public func set_payment_secret_optional() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_payment_secret_optional(this_argPointer);
    }

    public func set_payment_secret_required() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_payment_secret_required(this_argPointer);
    }

    public func supports_payment_secret() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_supports_payment_secret(this_argPointer)
};
    }

    public func requires_payment_secret() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_requires_payment_secret(this_argPointer)
};
    }

    public func set_basic_mpp_optional() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_basic_mpp_optional(this_argPointer);
    }

    public func set_basic_mpp_required() -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKInvoiceFeatures>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return InvoiceFeatures_set_basic_mpp_required(this_argPointer);
    }

    public func supports_basic_mpp() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_supports_basic_mpp(this_argPointer)
};
    }

    public func requires_basic_mpp() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoiceFeatures>) in
InvoiceFeatures_requires_basic_mpp(this_argPointer)
};
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
							Bindings.print("Freeing InvoiceFeatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InvoiceFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

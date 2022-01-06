public class RouteParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRouteParameters?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(payee_arg: Payee, final_value_msat_arg: UInt64, final_cltv_expiry_delta_arg: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = RouteParameters_new(payee_arg.danglingClone().cOpaqueStruct!, final_value_msat_arg, final_cltv_expiry_delta_arg)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRouteParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRouteParameters, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_payee() -> Payee {
    	
        return Payee(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteParameters>) in
RouteParameters_get_payee(this_ptrPointer)
});
    }

    public func set_payee(val: Payee) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteParameters_set_payee(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_final_value_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteParameters>) in
RouteParameters_get_final_value_msat(this_ptrPointer)
};
    }

    public func set_final_value_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteParameters_set_final_value_msat(this_ptrPointer, val);
    }

    public func get_final_cltv_expiry_delta() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteParameters>) in
RouteParameters_get_final_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_final_cltv_expiry_delta(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteParameters_set_final_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func clone() -> RouteParameters {
    	
        return RouteParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteParameters>) in
RouteParameters_clone(origPointer)
});
    }

					internal func danglingClone() -> RouteParameters {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRouteParameters>) in
RouteParameters_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RouteParametersDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_RouteParametersDecodeErrorZ(pointer: RouteParameters_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return RouteParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RouteParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RouteParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RouteParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

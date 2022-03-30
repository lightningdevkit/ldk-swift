public class RoutingFees: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRoutingFees?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(base_msat_arg: UInt32, proportional_millionths_arg: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = RoutingFees_new(base_msat_arg, proportional_millionths_arg)
        super.init(conflictAvoidingVariableName: 0)
        /* POST_INIT_ANCHORING */
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRoutingFees){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRoutingFees, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_base_msat() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_get_base_msat(this_ptrPointer)
};
    }

    public func set_base_msat(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoutingFees>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RoutingFees_set_base_msat(this_ptrPointer, val);
    }

    public func get_proportional_millionths() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_get_proportional_millionths(this_ptrPointer)
};
    }

    public func set_proportional_millionths(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoutingFees>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RoutingFees_set_proportional_millionths(this_ptrPointer, val);
    }

    public class func eq(a: RoutingFees, b: RoutingFees) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRoutingFees>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> RoutingFees {
    	
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_clone(origPointer)
});
    }

					internal func danglingClone() -> RoutingFees {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_hash(oPointer)
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RoutingFeesDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_RoutingFeesDecodeErrorZ(pointer: RoutingFees_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return RoutingFees_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RoutingFees {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RoutingFees \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RoutingFees \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

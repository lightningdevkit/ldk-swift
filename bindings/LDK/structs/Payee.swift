public class Payee: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPayee?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkey: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Payee_for_keysend(Bindings.new_LDKPublicKey(array: pubkey))
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPayee){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPayee, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPayee>) in
Payee_get_pubkey(this_ptrPointer)
});
    }

    public func set_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPayee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Payee_set_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_features() -> InvoiceFeatures {
    	
        return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPayee>) in
Payee_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InvoiceFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPayee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Payee_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_route_hints() -> [RouteHint] {
    	
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPayee>) in
Payee_get_route_hints(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							RouteHint(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_route_hints(val: [RouteHint]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_route_hints(val: valUnwrapped);
    }

    internal func set_route_hints(val: [LDKRouteHint]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPayee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_RouteHintZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return Payee_set_route_hints(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_expiry_time() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPayee>) in
Payee_get_expiry_time(this_ptrPointer)
});
    }

    public func set_expiry_time(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPayee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Payee_set_expiry_time(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> Payee {
    	
        return Payee(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPayee>) in
Payee_clone(origPointer)
});
    }

					internal func danglingClone() -> Payee {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKPayee>) in
Payee_hash(oPointer)
};
    }

    public class func eq(a: Payee, b: Payee) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPayee>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPayee>) in
Payee_eq(aPointer, bPointer)
}
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPayee>) in
Payee_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PayeeDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_PayeeDecodeErrorZ(pointer: Payee_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Payee_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Payee {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Payee \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Payee \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

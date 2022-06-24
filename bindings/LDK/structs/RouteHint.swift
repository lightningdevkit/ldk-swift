#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class RouteHint: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRouteHint?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(a_arg: [LDKRouteHintHop]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let a_argWrapper = Bindings.new_LDKCVec_RouteHintHopZWrapper(array: a_arg)
						defer {
							a_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = RouteHint_new(a_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRouteHint){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRouteHint, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(a_arg: [RouteHintHop])  {
    	
							let a_argUnwrapped = a_arg.map { (a_argCurrentValue) in
							a_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        self.init(a_arg: a_argUnwrapped);
    }

    public func get_a() -> [RouteHintHop] {
    	
        return Bindings.LDKCVec_RouteHintHopZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_get_a(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							RouteHintHop(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_a(val: [RouteHintHop]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_a(val: valUnwrapped);
    }

    internal func set_a(val: [LDKRouteHintHop]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHint>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_RouteHintHopZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return RouteHint_set_a(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> RouteHint {
    	
        return RouteHint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_clone(origPointer)
});
    }

					internal func danglingClone() -> RouteHint {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_hash(oPointer)
};
    }

    public class func eq(a: RouteHint, b: RouteHint) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRouteHint>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_eq(aPointer, bPointer)
}
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RouteHintDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_RouteHintDecodeErrorZ(pointer: RouteHint_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return RouteHint_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RouteHint {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RouteHint \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RouteHint \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

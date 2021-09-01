public class Route: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKRoute?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(paths_arg: [[LDKRouteHop]]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let paths_argWrapper = Bindings.new_LDKCVec_CVec_RouteHopZZWrapper(array: paths_arg)
						defer {
							paths_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = Route_new(paths_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRoute){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRoute, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(paths_arg: [[RouteHop]])  {
    	
							let paths_argUnwrapped = paths_arg.map { (paths_argCurrentValue) in
							paths_argCurrentValue.map { (paths_argCurrentValue) in
							paths_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}}
						
        self.init(paths_arg: paths_argUnwrapped);
    }

    public func set_paths(val: [[RouteHop]]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}}
						
        return self.set_paths(val: valUnwrapped);
    }

    internal func set_paths(val: [[LDKRouteHop]]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoute>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_CVec_RouteHopZZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return Route_set_paths(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> Route {
    	
        return Route(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRoute>) in
Route_clone(origPointer)
});
    }

					internal func danglingClone() -> Route {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRoute>) in
Route_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RouteDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_RouteDecodeErrorZ(pointer: Route_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Route_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Route {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Route \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Route \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

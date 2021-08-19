public class Route {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKRoute?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(paths_arg: [[LDKRouteHop]]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Route_new(Bindings.new_LDKCVec_CVec_RouteHopZZWrapper(array: paths_arg).cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRoute){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func set_paths(val: [[LDKRouteHop]]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoute>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Route_set_paths(this_ptrPointer, Bindings.new_LDKCVec_CVec_RouteHopZZWrapper(array: val).cOpaqueStruct!);
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
    	
        return Result_RouteDecodeErrorZ(pointer: Route_read(Bindings.new_LDKu8slice(array: ser)));
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
							print("Freeing Route \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Route \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

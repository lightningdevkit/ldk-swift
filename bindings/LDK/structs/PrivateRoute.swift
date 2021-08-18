public class PrivateRoute {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPrivateRoute?;


	

    public init(pointer: LDKPrivateRoute){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: PrivateRoute, b: PrivateRoute) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPrivateRoute>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> PrivateRoute {
    	
        return PrivateRoute(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_clone(origPointer)
});
    }

					internal func danglingClone() -> PrivateRoute {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(hops: RouteHint) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: PrivateRoute_new(hops.danglingClone().cOpaqueStruct!));
    }

    public func into_inner() -> RouteHint {
    	
        return RouteHint(pointer: PrivateRoute_into_inner(self.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return PrivateRoute_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PrivateRoute {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

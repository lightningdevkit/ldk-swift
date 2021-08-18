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

    public class func new(hops: RouteHint) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: PrivateRoute_new(hops.clone().cOpaqueStruct!));
    }

    public func into_inner() -> RouteHint {
    	
        return RouteHint(pointer: PrivateRoute_into_inner(self.clone().cOpaqueStruct!));
    }

				
	deinit {
					
					
					
		PrivateRoute_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

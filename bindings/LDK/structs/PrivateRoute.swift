public class PrivateRoute {

    public internal(set) var cOpaqueStruct: LDKPrivateRoute?;

	

    public init(pointer: LDKPrivateRoute){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: PrivateRoute, b: PrivateRoute) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPrivateRoute>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> PrivateRoute {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute(pointer: PrivateRoute_clone(origPointer))
};
    }

    public func new(hops: RouteHint) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: PrivateRoute_new(hops.cOpaqueStruct!));
    }

    public func into_inner() -> RouteHint {
    	
        return RouteHint(pointer: PrivateRoute_into_inner(self.cOpaqueStruct!));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		PrivateRoute_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

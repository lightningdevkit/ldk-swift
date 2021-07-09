public class RouteHint {

    var cOpaqueStruct: LDKRouteHint?;

	

    public init(pointer: LDKRouteHint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: RouteHint) -> RouteHint {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHint>) in
RouteHint(pointer: RouteHint_clone(origPointer))
};
    }

    public func new(hops: [LDKRouteHintHop]) -> Result_RouteHintCreationErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_RouteHintCreationErrorZ(pointer: RouteHint_new(Bindings.new_LDKCVec_RouteHintHopZ(array: hops)));
    }

    public func into_inner(this_arg: RouteHint) -> [LDKRouteHintHop] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_RouteHintHopZ_to_array(nativeType: RouteHint_into_inner(this_arg.cOpaqueStruct!));
    }

				
	deinit {
					
					
		RouteHint_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

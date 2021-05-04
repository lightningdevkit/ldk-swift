class RouteHint {

    var cOpaqueStruct: LDKRouteHint?;

	

    init(pointer: LDKRouteHint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: RouteHint) -> RouteHint {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint(pointer: RouteHint_clone(origPointer));
    }

    func new(hops: [RouteHintHop]) -> Result_RouteHintCreationErrorZ {
    	
        return Result_RouteHintCreationErrorZ(pointer: RouteHint_new(Bindings.new_LDKCVec_RouteHintHopZ(array: hops)));
    }

    func into_inner(this_arg: RouteHint) -> [LDKRouteHintHop] {
    	
        return Bindings.LDKCVec_RouteHintHopZ_to_array(nativeType: RouteHint_into_inner(this_arg.cOpaqueStruct!));
    }

				
	deinit {
					
					
		RouteHint_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

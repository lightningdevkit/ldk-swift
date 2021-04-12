class RouteHint {

    var cOpaqueStruct: LDKRouteHint?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKRouteHint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_src_node_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_get_src_node_id(this_ptrPointer);
    }

    func set_src_node_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_set_src_node_id(this_ptrPointer, val);
    }

    func get_short_channel_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_set_short_channel_id(this_ptrPointer, val);
    }

    func get_fees() -> RoutingFees {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_get_fees(this_ptrPointer);
    }

    func set_fees(val: RoutingFees) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_set_fees(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func clone(orig: RouteHint) -> RouteHint {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHint>) in
							
			pointer
						
		}
					
        return RouteHint(pointer: RouteHint_clone(origPointer));
    }

				
	deinit {
					
					
		RouteHint_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

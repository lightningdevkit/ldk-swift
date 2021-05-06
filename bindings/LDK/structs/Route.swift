public class Route {

    var cOpaqueStruct: LDKRoute?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(paths_arg: [[LDKRouteHop]]) {
    	
		let converted_paths_arg = Bindings.new_LDKCVec_CVec_RouteHopZZ(array: paths_arg)
        self.cOpaqueStruct = Route_new(converted_paths_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRoute){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func set_paths(val: [[LDKRouteHop]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Route_set_paths(this_ptrPointer, Bindings.new_LDKCVec_CVec_RouteHopZZ(array: val));
    }

    public func clone(orig: Route) -> Route {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Route(pointer: Route_clone(origPointer));
    }

    public func write(obj: Route) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Route_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_RouteDecodeErrorZ {
    	
        return Result_RouteDecodeErrorZ(pointer: Route_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Route_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

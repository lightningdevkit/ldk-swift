class Route {

    var cOpaqueStruct: LDKRoute?;

    init(paths_arg: [[RouteHop]]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = Route_new(paths_arg)
    }

    private init(pointer: LDKRoute){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func set_paths(val: [[RouteHop]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Route_set_paths(this_ptrPointer, val);
    }

    func clone(orig: Route) -> Route {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Route(pointer: Route_clone(origPointer));
    }

    func write(obj: Route) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoute>) in
							
			pointer
						
		}
					
        return Route_write(objPointer);
    }

    func read(ser: [U]) -> Result_RouteDecodeErrorZ {
    	
        return Route_read(ser);
    }

				
	deinit {
					
					
		Route_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

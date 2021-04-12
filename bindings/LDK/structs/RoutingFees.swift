class RoutingFees {

    var cOpaqueStruct: LDKRoutingFees?;

    init(base_msat_arg: U, proportional_millionths_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = RoutingFees_new(base_msat_arg, proportional_millionths_arg)
    }

    private init(pointer: LDKRoutingFees){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_base_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees_get_base_msat(this_ptrPointer);
    }

    func set_base_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees_set_base_msat(this_ptrPointer, val);
    }

    func get_proportional_millionths() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees_get_proportional_millionths(this_ptrPointer);
    }

    func set_proportional_millionths(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees_set_proportional_millionths(this_ptrPointer, val);
    }

    func clone(orig: RoutingFees) -> RoutingFees {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees(pointer: RoutingFees_clone(origPointer));
    }

    func read(ser: [U]) -> Result_RoutingFeesDecodeErrorZ {
    	
        return RoutingFees_read(ser);
    }

    func write(obj: RoutingFees) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRoutingFees>) in
							
			pointer
						
		}
					
        return RoutingFees_write(objPointer);
    }

				
	deinit {
					
					
		RoutingFees_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class LightningError {

    var cOpaqueStruct: LDKLightningError?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(err_arg: String, action_arg: ErrorAction) {
    	
        self.cOpaqueStruct = LightningError_new(err_arg, action_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKLightningError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_err() -> String {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError_get_err(this_ptrPointer);
    }

    func set_err(val: String) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError_set_err(this_ptrPointer, val);
    }

    func get_action() -> ErrorAction {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return ErrorAction(pointer: LightningError_get_action(this_ptrPointer));
    }

    func set_action(val: ErrorAction) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError_set_action(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: LightningError) -> LightningError {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError(pointer: LightningError_clone(origPointer));
    }

				
	deinit {
					
					
		LightningError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class LightningError {

    var cOpaqueStruct: LDKLightningError?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(err_arg: String, action_arg: ErrorAction) {
    	
		let converted_err_arg = Bindings.new_LDKStr(string: err_arg)
        self.cOpaqueStruct = LightningError_new(converted_err_arg, action_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKLightningError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_err() -> String {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return Bindings.LDKStr_to_string(nativeType: LightningError_get_err(this_ptrPointer));
    }

    public func set_err(val: String) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError_set_err(this_ptrPointer, Bindings.new_LDKStr(string: val));
    }

    public func get_action() -> ErrorAction {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return ErrorAction(pointer: LightningError_get_action(this_ptrPointer));
    }

    public func set_action(val: ErrorAction) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKLightningError>) in
							
			pointer
						
		}
					
        return LightningError_set_action(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: LightningError) -> LightningError {
    	
						
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

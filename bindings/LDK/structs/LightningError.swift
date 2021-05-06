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
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKLightningError>) in
LightningError_get_err(this_ptrPointer)
});
    }

    public func set_err(val: String) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKLightningError>) in
LightningError_set_err(this_ptrPointer, Bindings.new_LDKStr(string: val))
};
    }

    public func get_action() -> ErrorAction {
    	/* NATIVE_CALL_PREP */
        return ErrorAction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKLightningError>) in
LightningError_get_action(this_ptrPointer)
});
    }

    public func set_action(val: ErrorAction) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKLightningError>) in
LightningError_set_action(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: LightningError) -> LightningError {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKLightningError>) in
LightningError(pointer: LightningError_clone(origPointer))
};
    }

				
	deinit {
					
					
		LightningError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

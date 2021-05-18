public class LightningError {

    var cOpaqueStruct: LDKLightningError?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(err_arg: String, action_arg: ErrorAction) {
    	
        self.cOpaqueStruct = LightningError_new(Bindings.new_LDKStr(string: err_arg), action_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKLightningError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_err() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKLightningError>) in
LightningError_get_err(this_ptrPointer)
});
    }

    public func set_err(val: String) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKLightningError>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return LightningError_set_err(this_ptrPointer, Bindings.new_LDKStr(string: val));
    }

    public func get_action() -> ErrorAction {
    	
        return ErrorAction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKLightningError>) in
LightningError_get_action(this_ptrPointer)
});
    }

    public func set_action(val: ErrorAction) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKLightningError>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return LightningError_set_action(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: LightningError) -> LightningError {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKLightningError>) in
LightningError(pointer: LightningError_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		LightningError_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

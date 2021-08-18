public class LightningError {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKLightningError?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(err_arg: String, action_arg: ErrorAction) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = LightningError_new(Bindings.new_LDKStr(string: err_arg), action_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKLightningError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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
						
        return LightningError_set_action(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> LightningError {
    	
        return LightningError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKLightningError>) in
LightningError_clone(origPointer)
});
    }

					internal func danglingClone() -> LightningError {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return LightningError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> LightningError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

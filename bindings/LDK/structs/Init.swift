public class Init {

    var cOpaqueStruct: LDKInit?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: InitFeatures) {
    	
        self.cOpaqueStruct = Init_new(features_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInit){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> InitFeatures {
    	/* NATIVE_CALL_PREP */
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInit>) in
Init_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InitFeatures) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKInit>) in
Init_set_features(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: Init) -> Init {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInit>) in
Init(pointer: Init_clone(origPointer))
};
    }

    public func write(obj: Init) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInit>) in
Init_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_InitDecodeErrorZ(pointer: Init_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Init_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

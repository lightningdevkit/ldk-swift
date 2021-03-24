class OpaqueStructName {

    var cOpaqueStruct: OpaqueStructType?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: OpaqueStructType){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */
    func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return OpaqueStructType_methodName(native_arguments);
    }
    /* STRUCT_METHODS_END */

}

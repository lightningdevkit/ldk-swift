class OpaqueStructName {

    var cOpaqueStruct: OpaqueStructType?;

    init() {
        self.cOpaqueStruct = OpaqueStructType()
    }

    /* STRUCT_METHODS_START */
    func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        OpaqueStructType_methodName(native_arguments);
    }
    /* STRUCT_METHODS_END */

}

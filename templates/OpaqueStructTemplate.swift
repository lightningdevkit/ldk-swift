class OpaqueStructName {

    var cOpaqueStruct: OpaqueStructType?;

    init() {
        self.cOpaqueStruct = OpaqueStructType()
    }

    /* STRUCT_METHODS_START */
    func methodName(swift_arguments) -> Void {
        OpaqueStructType_methodName(self.cOpaqueStruct, native_arguments);
    }
    /* STRUCT_METHODS_END */

}

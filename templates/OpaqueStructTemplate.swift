public class OpaqueStructName {

    public internal(set) var cOpaqueStruct: OpaqueStructType?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: OpaqueStructType){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */
    public func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return OpaqueStructType_methodName(native_arguments);
    }
    /* STRUCT_METHODS_END */

}

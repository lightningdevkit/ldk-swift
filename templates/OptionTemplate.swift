public class OptionName {

    var cOpaqueStruct: OptionType?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OptionType(native_constructor_arguments)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: OptionType){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */
    public func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return OptionType_methodName(native_arguments);
    }
    /* OPTION_METHODS_END */

}

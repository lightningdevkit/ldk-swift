public class ResultName {

    var cOpaqueStruct: ResultType?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ResultType(native_constructor_arguments)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: ResultType){
		self.cOpaqueStruct = pointer
	}

    /* RESULT_METHODS_START */
    func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return ResultType_methodName(native_arguments);
    }
    /* RESULT_METHODS_END */

}

class TupleName {

    var cTuple: TupleType?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: TupleType){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */
    func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return TupleType_methodName(native_arguments);
    }
    /* TUPLE_METHODS_END */

}

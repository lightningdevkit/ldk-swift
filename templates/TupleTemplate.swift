class TupleName {

    var cTuple: TupleType?;

    init() {
        self.cTuple = TupleType()
    }

    /* TUPLE_METHODS_START */
    func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        TupleType_methodName(native_arguments);
    }
    /* TUPLE_METHODS_END */

}

public class TupleName {

    var cOpaqueStruct: TupleType?;

    init(pointer: TupleType){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */
    public func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return TupleType_methodName(native_arguments);
    }
    /* TUPLE_METHODS_END */

}

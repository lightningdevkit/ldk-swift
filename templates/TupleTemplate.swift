public class TupleName {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: TupleType?;

    public init(pointer: TupleType){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */
    public func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return TupleType_methodName(native_arguments);
    }
    /* TUPLE_METHODS_END */

}

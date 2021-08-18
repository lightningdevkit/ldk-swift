public class ResultName {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: ResultType?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(swift_constructor_arguments) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ResultType(native_constructor_arguments)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: ResultType){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */
    public func methodName(swift_arguments) -> Void {
    	/* NATIVE_CALL_PREP */
        return ResultType_methodName(native_arguments);
    }
    /* RESULT_METHODS_END */

}

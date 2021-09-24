public class ResultName: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: ResultType?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(swift_constructor_arguments) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ResultType(native_constructor_arguments)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: ResultType){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: ResultType, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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

public class Result_PositiveTimestampCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_PositiveTimestampCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PositiveTimestampCreationErrorZ(contents: LDKCResult_PositiveTimestampCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PositiveTimestampCreationErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> PositiveTimestamp? {
				if self.cOpaqueStruct?.result_ok == true {
					return PositiveTimestamp(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: PositiveTimestamp) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_PositiveTimestampCreationErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PositiveTimestampCreationErrorZ>) in
CResult_PositiveTimestampCreationErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

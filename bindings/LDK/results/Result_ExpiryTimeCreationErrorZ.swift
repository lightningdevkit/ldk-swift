public class Result_ExpiryTimeCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ExpiryTimeCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ExpiryTimeCreationErrorZ(contents: LDKCResult_ExpiryTimeCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ExpiryTimeCreationErrorZ){
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
			
			public func getValue() -> ExpiryTime? {
				if self.cOpaqueStruct?.result_ok == true {
					return ExpiryTime(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ExpiryTime) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: CResult_ExpiryTimeCreationErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: CResult_ExpiryTimeCreationErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_ExpiryTimeCreationErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ExpiryTimeCreationErrorZ {
    	
        return Result_ExpiryTimeCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ExpiryTimeCreationErrorZ>) in
CResult_ExpiryTimeCreationErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

public class Result_ErrorMessageDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ErrorMessageDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ErrorMessageDecodeErrorZ(contents: LDKCResult_ErrorMessageDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ErrorMessageDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> ErrorMessage? {
				if self.cOpaqueStruct?.result_ok == true {
					return ErrorMessage(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ErrorMessage) -> Result_ErrorMessageDecodeErrorZ {
    	
        return Result_ErrorMessageDecodeErrorZ(pointer: CResult_ErrorMessageDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ErrorMessageDecodeErrorZ {
    	
        return Result_ErrorMessageDecodeErrorZ(pointer: CResult_ErrorMessageDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ErrorMessageDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ErrorMessageDecodeErrorZ {
    	
        return Result_ErrorMessageDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ErrorMessageDecodeErrorZ>) in
CResult_ErrorMessageDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

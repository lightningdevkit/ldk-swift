public class Result_FundingLockedDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_FundingLockedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_FundingLockedDecodeErrorZ(contents: LDKCResult_FundingLockedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_FundingLockedDecodeErrorZ){
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
			
			public func getValue() -> FundingLocked? {
				if self.cOpaqueStruct?.result_ok == true {
					return FundingLocked(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: FundingLocked) -> Result_FundingLockedDecodeErrorZ {
    	
        return Result_FundingLockedDecodeErrorZ(pointer: CResult_FundingLockedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_FundingLockedDecodeErrorZ {
    	
        return Result_FundingLockedDecodeErrorZ(pointer: CResult_FundingLockedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_FundingLockedDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_FundingLockedDecodeErrorZ {
    	
        return Result_FundingLockedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FundingLockedDecodeErrorZ>) in
CResult_FundingLockedDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

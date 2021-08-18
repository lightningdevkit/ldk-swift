public class Result_CommitmentSignedDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_CommitmentSignedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CommitmentSignedDecodeErrorZ(contents: LDKCResult_CommitmentSignedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CommitmentSignedDecodeErrorZ){
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
			
			public func getValue() -> CommitmentSigned? {
				if self.cOpaqueStruct?.result_ok == true {
					return CommitmentSigned(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: CommitmentSigned) -> Result_CommitmentSignedDecodeErrorZ {
    	
        return Result_CommitmentSignedDecodeErrorZ(pointer: CResult_CommitmentSignedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_CommitmentSignedDecodeErrorZ {
    	
        return Result_CommitmentSignedDecodeErrorZ(pointer: CResult_CommitmentSignedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_CommitmentSignedDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_CommitmentSignedDecodeErrorZ {
    	
        return Result_CommitmentSignedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CommitmentSignedDecodeErrorZ>) in
CResult_CommitmentSignedDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

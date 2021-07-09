public class Result_HTLCOutputInCommitmentDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_HTLCOutputInCommitmentDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_HTLCOutputInCommitmentDecodeErrorZ(contents: LDKCResult_HTLCOutputInCommitmentDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_HTLCOutputInCommitmentDecodeErrorZ){
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
			
			public func getValue() -> HTLCOutputInCommitment? {
				if self.cOpaqueStruct?.result_ok == true {
					return HTLCOutputInCommitment(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

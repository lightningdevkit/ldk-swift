public class Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(contents: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ){
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
			
    /* RESULT_METHODS_END */

}

public class Result_ChannelPublicKeysDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelPublicKeysDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelPublicKeysDecodeErrorZ(contents: LDKCResult_ChannelPublicKeysDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelPublicKeysDecodeErrorZ){
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
			
			public func getValue() -> ChannelPublicKeys? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelPublicKeys(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

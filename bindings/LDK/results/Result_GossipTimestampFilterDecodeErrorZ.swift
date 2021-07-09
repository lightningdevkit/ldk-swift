public class Result_GossipTimestampFilterDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_GossipTimestampFilterDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_GossipTimestampFilterDecodeErrorZ(contents: LDKCResult_GossipTimestampFilterDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_GossipTimestampFilterDecodeErrorZ){
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
			
			public func getValue() -> GossipTimestampFilter? {
				if self.cOpaqueStruct?.result_ok == true {
					return GossipTimestampFilter(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

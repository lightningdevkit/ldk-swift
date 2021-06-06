public class Result_CVec_u8ZPeerHandleErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_u8ZPeerHandleErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_u8ZPeerHandleErrorZ(contents: LDKCResult_CVec_u8ZPeerHandleErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_u8ZPeerHandleErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> PeerHandleError? {
				if self.cOpaqueStruct?.result_ok == false {
					return PeerHandleError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

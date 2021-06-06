public class Result_boolPeerHandleErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_boolPeerHandleErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_boolPeerHandleErrorZ(contents: LDKCResult_boolPeerHandleErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_boolPeerHandleErrorZ){
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

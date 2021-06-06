public class Result_NonePeerHandleErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NonePeerHandleErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NonePeerHandleErrorZ(contents: LDKCResult_NonePeerHandleErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NonePeerHandleErrorZ){
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

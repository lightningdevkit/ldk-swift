public class Result_NodeAnnouncementDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NodeAnnouncementDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NodeAnnouncementDecodeErrorZ(contents: LDKCResult_NodeAnnouncementDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NodeAnnouncementDecodeErrorZ){
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
			
			public func getValue() -> NodeAnnouncement? {
				if self.cOpaqueStruct?.result_ok == true {
					return NodeAnnouncement(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}

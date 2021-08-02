public class Result_UnsignedNodeAnnouncementDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_UnsignedNodeAnnouncementDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_UnsignedNodeAnnouncementDecodeErrorZ(contents: LDKCResult_UnsignedNodeAnnouncementDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UnsignedNodeAnnouncementDecodeErrorZ){
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
			
			public func getValue() -> UnsignedNodeAnnouncement? {
				if self.cOpaqueStruct?.result_ok == true {
					return UnsignedNodeAnnouncement(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: UnsignedNodeAnnouncement) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: CResult_UnsignedNodeAnnouncementDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: CResult_UnsignedNodeAnnouncementDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_UnsignedNodeAnnouncementDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UnsignedNodeAnnouncementDecodeErrorZ>) in
CResult_UnsignedNodeAnnouncementDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

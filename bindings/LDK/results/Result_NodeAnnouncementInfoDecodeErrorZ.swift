import LDKHeaders

public class Result_NodeAnnouncementInfoDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NodeAnnouncementInfoDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NodeAnnouncementInfoDecodeErrorZ(contents: LDKCResult_NodeAnnouncementInfoDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NodeAnnouncementInfoDecodeErrorZ){
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
			
			public func getValue() -> NodeAnnouncementInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return NodeAnnouncementInfo(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NodeAnnouncementInfo) -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: CResult_NodeAnnouncementInfoDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: CResult_NodeAnnouncementInfoDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NodeAnnouncementInfoDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NodeAnnouncementInfoDecodeErrorZ>) in
CResult_NodeAnnouncementInfoDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

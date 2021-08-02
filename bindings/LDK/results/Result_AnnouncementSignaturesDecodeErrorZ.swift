public class Result_AnnouncementSignaturesDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_AnnouncementSignaturesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_AnnouncementSignaturesDecodeErrorZ(contents: LDKCResult_AnnouncementSignaturesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_AnnouncementSignaturesDecodeErrorZ){
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
			
			public func getValue() -> AnnouncementSignatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return AnnouncementSignatures(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: AnnouncementSignatures) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: CResult_AnnouncementSignaturesDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: CResult_AnnouncementSignaturesDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_AnnouncementSignaturesDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_AnnouncementSignaturesDecodeErrorZ>) in
CResult_AnnouncementSignaturesDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

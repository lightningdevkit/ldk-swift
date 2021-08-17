import LDKHeaders

public class Result_OpenChannelDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_OpenChannelDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_OpenChannelDecodeErrorZ(contents: LDKCResult_OpenChannelDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_OpenChannelDecodeErrorZ){
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
			
			public func getValue() -> OpenChannel? {
				if self.cOpaqueStruct?.result_ok == true {
					return OpenChannel(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: OpenChannel) -> Result_OpenChannelDecodeErrorZ {
    	
        return Result_OpenChannelDecodeErrorZ(pointer: CResult_OpenChannelDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_OpenChannelDecodeErrorZ {
    	
        return Result_OpenChannelDecodeErrorZ(pointer: CResult_OpenChannelDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_OpenChannelDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_OpenChannelDecodeErrorZ {
    	
        return Result_OpenChannelDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_OpenChannelDecodeErrorZ>) in
CResult_OpenChannelDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

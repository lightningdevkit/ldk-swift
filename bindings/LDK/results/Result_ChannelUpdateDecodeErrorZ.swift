public class Result_ChannelUpdateDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelUpdateDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelUpdateDecodeErrorZ(contents: LDKCResult_ChannelUpdateDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelUpdateDecodeErrorZ){
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
			
			public func getValue() -> ChannelUpdate? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelUpdate(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelUpdate) -> Result_ChannelUpdateDecodeErrorZ {
    	
        return Result_ChannelUpdateDecodeErrorZ(pointer: CResult_ChannelUpdateDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelUpdateDecodeErrorZ {
    	
        return Result_ChannelUpdateDecodeErrorZ(pointer: CResult_ChannelUpdateDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ChannelUpdateDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ChannelUpdateDecodeErrorZ {
    	
        return Result_ChannelUpdateDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelUpdateDecodeErrorZ>) in
CResult_ChannelUpdateDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

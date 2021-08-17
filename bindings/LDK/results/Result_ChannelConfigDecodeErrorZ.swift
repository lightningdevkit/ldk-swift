import LDKHeaders

public class Result_ChannelConfigDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelConfigDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelConfigDecodeErrorZ(contents: LDKCResult_ChannelConfigDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelConfigDecodeErrorZ){
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
			
			public func getValue() -> ChannelConfig? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelConfig(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelConfig) -> Result_ChannelConfigDecodeErrorZ {
    	
        return Result_ChannelConfigDecodeErrorZ(pointer: CResult_ChannelConfigDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelConfigDecodeErrorZ {
    	
        return Result_ChannelConfigDecodeErrorZ(pointer: CResult_ChannelConfigDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ChannelConfigDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ChannelConfigDecodeErrorZ {
    	
        return Result_ChannelConfigDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelConfigDecodeErrorZ>) in
CResult_ChannelConfigDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

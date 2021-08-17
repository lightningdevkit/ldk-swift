import LDKHeaders

public class Result_ChannelPublicKeysDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelPublicKeysDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelPublicKeysDecodeErrorZ(contents: LDKCResult_ChannelPublicKeysDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelPublicKeysDecodeErrorZ){
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
			
			public func getValue() -> ChannelPublicKeys? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelPublicKeys(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelPublicKeys) -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return Result_ChannelPublicKeysDecodeErrorZ(pointer: CResult_ChannelPublicKeysDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return Result_ChannelPublicKeysDecodeErrorZ(pointer: CResult_ChannelPublicKeysDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ChannelPublicKeysDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return Result_ChannelPublicKeysDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelPublicKeysDecodeErrorZ>) in
CResult_ChannelPublicKeysDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_AcceptChannelDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_AcceptChannelDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_AcceptChannelDecodeErrorZ(contents: LDKCResult_AcceptChannelDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_AcceptChannelDecodeErrorZ){
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
			
			public func getValue() -> AcceptChannel? {
				if self.cOpaqueStruct?.result_ok == true {
					return AcceptChannel(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: AcceptChannel) -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: CResult_AcceptChannelDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: CResult_AcceptChannelDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_AcceptChannelDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_AcceptChannelDecodeErrorZ>) in
CResult_AcceptChannelDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

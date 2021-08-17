import LDKHeaders

public class Result_ChannelTransactionParametersDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelTransactionParametersDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelTransactionParametersDecodeErrorZ(contents: LDKCResult_ChannelTransactionParametersDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelTransactionParametersDecodeErrorZ){
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
			
			public func getValue() -> ChannelTransactionParameters? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelTransactionParameters(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelTransactionParameters) -> Result_ChannelTransactionParametersDecodeErrorZ {
    	
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: CResult_ChannelTransactionParametersDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelTransactionParametersDecodeErrorZ {
    	
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: CResult_ChannelTransactionParametersDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ChannelTransactionParametersDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ChannelTransactionParametersDecodeErrorZ {
    	
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelTransactionParametersDecodeErrorZ>) in
CResult_ChannelTransactionParametersDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

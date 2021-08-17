import LDKHeaders

public class Result_CounterpartyChannelTransactionParametersDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ(contents: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ){
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
			
			public func getValue() -> CounterpartyChannelTransactionParameters? {
				if self.cOpaqueStruct?.result_ok == true {
					return CounterpartyChannelTransactionParameters(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: CounterpartyChannelTransactionParameters) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ>) in
CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

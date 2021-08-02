public class Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(contents: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ){
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
			
			public func getValue() -> C2Tuple_BlockHashChannelManagerZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_BlockHashChannelManagerZ(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_BlockHashChannelManagerZ) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
    	
        return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_ok(o.cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
    	
        return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}

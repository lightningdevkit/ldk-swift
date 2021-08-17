import LDKHeaders

public class Result_QueryChannelRangeDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_QueryChannelRangeDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_QueryChannelRangeDecodeErrorZ(contents: LDKCResult_QueryChannelRangeDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_QueryChannelRangeDecodeErrorZ){
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
			
			public func getValue() -> QueryChannelRange? {
				if self.cOpaqueStruct?.result_ok == true {
					return QueryChannelRange(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: QueryChannelRange) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: CResult_QueryChannelRangeDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: CResult_QueryChannelRangeDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_QueryChannelRangeDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_QueryChannelRangeDecodeErrorZ>) in
CResult_QueryChannelRangeDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

public class Result_PingDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_PingDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PingDecodeErrorZ(contents: LDKCResult_PingDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PingDecodeErrorZ){
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
			
			public func getValue() -> Ping? {
				if self.cOpaqueStruct?.result_ok == true {
					return Ping(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Ping) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: CResult_PingDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: CResult_PingDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_PingDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PingDecodeErrorZ>) in
CResult_PingDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_ShutdownDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_ShutdownDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ShutdownDecodeErrorZ(contents: LDKCResult_ShutdownDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ShutdownDecodeErrorZ){
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
			
			public func getValue() -> Shutdown? {
				if self.cOpaqueStruct?.result_ok == true {
					return Shutdown(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Shutdown) -> Result_ShutdownDecodeErrorZ {
    	
        return Result_ShutdownDecodeErrorZ(pointer: CResult_ShutdownDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ShutdownDecodeErrorZ {
    	
        return Result_ShutdownDecodeErrorZ(pointer: CResult_ShutdownDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ShutdownDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ShutdownDecodeErrorZ {
    	
        return Result_ShutdownDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ShutdownDecodeErrorZ>) in
CResult_ShutdownDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

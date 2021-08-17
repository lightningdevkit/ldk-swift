import LDKHeaders

public class Result_InMemorySignerDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_InMemorySignerDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_InMemorySignerDecodeErrorZ(contents: LDKCResult_InMemorySignerDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InMemorySignerDecodeErrorZ){
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
			
			public func getValue() -> InMemorySigner? {
				if self.cOpaqueStruct?.result_ok == true {
					return InMemorySigner(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: InMemorySigner) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: CResult_InMemorySignerDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: CResult_InMemorySignerDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_InMemorySignerDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InMemorySignerDecodeErrorZ>) in
CResult_InMemorySignerDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_NetAddressDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NetAddressDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NetAddressDecodeErrorZ(contents: LDKCResult_NetAddressDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetAddressDecodeErrorZ){
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
			
			public func getValue() -> NetAddress? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetAddress(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NetAddress) -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: CResult_NetAddressDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: CResult_NetAddressDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NetAddressDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NetAddressDecodeErrorZ>) in
CResult_NetAddressDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

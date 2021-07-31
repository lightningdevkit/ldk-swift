public class Result_NetAddressu8Z {

    public internal(set) var cOpaqueStruct: LDKCResult_NetAddressu8Z?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NetAddressu8Z(contents: LDKCResult_NetAddressu8ZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetAddressu8Z){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> UInt8? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> NetAddress? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetAddress(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NetAddress) -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: CResult_NetAddressu8Z_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: UInt8) -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: CResult_NetAddressu8Z_err(e));
    }

    public func free() -> Void {
    	
        return CResult_NetAddressu8Z_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NetAddressu8Z>) in
CResult_NetAddressu8Z_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

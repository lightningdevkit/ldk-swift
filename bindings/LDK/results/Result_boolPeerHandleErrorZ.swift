public class Result_boolPeerHandleErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_boolPeerHandleErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_boolPeerHandleErrorZ(contents: LDKCResult_boolPeerHandleErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_boolPeerHandleErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> PeerHandleError? {
				if self.cOpaqueStruct?.result_ok == false {
					return PeerHandleError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> Bool? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
    public class func ok(o: Bool) -> Result_boolPeerHandleErrorZ {
    	
        return Result_boolPeerHandleErrorZ(pointer: CResult_boolPeerHandleErrorZ_ok(o));
    }

    public class func err(e: PeerHandleError) -> Result_boolPeerHandleErrorZ {
    	
        return Result_boolPeerHandleErrorZ(pointer: CResult_boolPeerHandleErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_boolPeerHandleErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_boolPeerHandleErrorZ {
    	
        return Result_boolPeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_boolPeerHandleErrorZ>) in
CResult_boolPeerHandleErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

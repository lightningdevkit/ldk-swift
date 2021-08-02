public class Result_NodeInfoDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NodeInfoDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NodeInfoDecodeErrorZ(contents: LDKCResult_NodeInfoDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NodeInfoDecodeErrorZ){
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
			
			public func getValue() -> NodeInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return NodeInfo(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NodeInfo) -> Result_NodeInfoDecodeErrorZ {
    	
        return Result_NodeInfoDecodeErrorZ(pointer: CResult_NodeInfoDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NodeInfoDecodeErrorZ {
    	
        return Result_NodeInfoDecodeErrorZ(pointer: CResult_NodeInfoDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NodeInfoDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NodeInfoDecodeErrorZ {
    	
        return Result_NodeInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NodeInfoDecodeErrorZ>) in
CResult_NodeInfoDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

import LDKHeaders

public class Result_NoneChannelMonitorUpdateErrZ {

    public internal(set) var cOpaqueStruct: LDKCResult_NoneChannelMonitorUpdateErrZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneChannelMonitorUpdateErrZ(contents: LDKCResult_NoneChannelMonitorUpdateErrZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKChannelMonitorUpdateErr? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
    public class func ok() -> Result_NoneChannelMonitorUpdateErrZ {
    	
        return Result_NoneChannelMonitorUpdateErrZ(pointer: CResult_NoneChannelMonitorUpdateErrZ_ok());
    }

    public class func err(e: LDKChannelMonitorUpdateErr) -> Result_NoneChannelMonitorUpdateErrZ {
    	
        return Result_NoneChannelMonitorUpdateErrZ(pointer: CResult_NoneChannelMonitorUpdateErrZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_NoneChannelMonitorUpdateErrZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NoneChannelMonitorUpdateErrZ {
    	
        return Result_NoneChannelMonitorUpdateErrZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneChannelMonitorUpdateErrZ>) in
CResult_NoneChannelMonitorUpdateErrZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

public class Result_NoneChannelMonitorUpdateErrZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NoneChannelMonitorUpdateErrZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NoneChannelMonitorUpdateErrZ(contents: LDKCResult_NoneChannelMonitorUpdateErrZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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

    internal func free() -> Void {
    	
        return CResult_NoneChannelMonitorUpdateErrZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneChannelMonitorUpdateErrZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_NoneChannelMonitorUpdateErrZ {
    	
        return Result_NoneChannelMonitorUpdateErrZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneChannelMonitorUpdateErrZ>) in
CResult_NoneChannelMonitorUpdateErrZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneChannelMonitorUpdateErrZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

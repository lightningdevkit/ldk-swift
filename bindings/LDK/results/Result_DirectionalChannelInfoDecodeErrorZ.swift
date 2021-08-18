public class Result_DirectionalChannelInfoDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_DirectionalChannelInfoDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_DirectionalChannelInfoDecodeErrorZ(contents: LDKCResult_DirectionalChannelInfoDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_DirectionalChannelInfoDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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
			
			public func getValue() -> DirectionalChannelInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return DirectionalChannelInfo(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: DirectionalChannelInfo) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: CResult_DirectionalChannelInfoDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: CResult_DirectionalChannelInfoDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_DirectionalChannelInfoDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_DirectionalChannelInfoDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DirectionalChannelInfoDecodeErrorZ>) in
CResult_DirectionalChannelInfoDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_DirectionalChannelInfoDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

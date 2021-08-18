public class Result_ReplyShortChannelIdsEndDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ(contents: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ){
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
			
			public func getValue() -> ReplyShortChannelIdsEnd? {
				if self.cOpaqueStruct?.result_ok == true {
					return ReplyShortChannelIdsEnd(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ReplyShortChannelIdsEnd) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: CResult_ReplyShortChannelIdsEndDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: CResult_ReplyShortChannelIdsEndDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ReplyShortChannelIdsEndDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ReplyShortChannelIdsEndDecodeErrorZ>) in
CResult_ReplyShortChannelIdsEndDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

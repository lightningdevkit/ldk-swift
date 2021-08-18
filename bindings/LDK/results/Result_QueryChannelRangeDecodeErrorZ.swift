public class Result_QueryChannelRangeDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_QueryChannelRangeDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_QueryChannelRangeDecodeErrorZ(contents: LDKCResult_QueryChannelRangeDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_QueryChannelRangeDecodeErrorZ){
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
			
			public func getValue() -> QueryChannelRange? {
				if self.cOpaqueStruct?.result_ok == true {
					return QueryChannelRange(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: QueryChannelRange) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: CResult_QueryChannelRangeDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: CResult_QueryChannelRangeDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_QueryChannelRangeDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_QueryChannelRangeDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_QueryChannelRangeDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_QueryChannelRangeDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_QueryChannelRangeDecodeErrorZ>) in
CResult_QueryChannelRangeDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_QueryChannelRangeDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

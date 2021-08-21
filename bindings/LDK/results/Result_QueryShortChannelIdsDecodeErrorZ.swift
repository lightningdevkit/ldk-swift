public class Result_QueryShortChannelIdsDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_QueryShortChannelIdsDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_QueryShortChannelIdsDecodeErrorZ(contents: LDKCResult_QueryShortChannelIdsDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_QueryShortChannelIdsDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
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
			
			public func getValue() -> QueryShortChannelIds? {
				if self.cOpaqueStruct?.result_ok == true {
					return QueryShortChannelIds(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: QueryShortChannelIds) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: CResult_QueryShortChannelIdsDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: CResult_QueryShortChannelIdsDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_QueryShortChannelIdsDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_QueryShortChannelIdsDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_QueryShortChannelIdsDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_QueryShortChannelIdsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_QueryShortChannelIdsDecodeErrorZ>) in
CResult_QueryShortChannelIdsDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_QueryShortChannelIdsDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

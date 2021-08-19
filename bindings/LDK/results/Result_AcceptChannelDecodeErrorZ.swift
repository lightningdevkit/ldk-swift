public class Result_AcceptChannelDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_AcceptChannelDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_AcceptChannelDecodeErrorZ(contents: LDKCResult_AcceptChannelDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_AcceptChannelDecodeErrorZ){
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
			
			public func getValue() -> AcceptChannel? {
				if self.cOpaqueStruct?.result_ok == true {
					return AcceptChannel(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: AcceptChannel) -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: CResult_AcceptChannelDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: CResult_AcceptChannelDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_AcceptChannelDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_AcceptChannelDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_AcceptChannelDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_AcceptChannelDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_AcceptChannelDecodeErrorZ>) in
CResult_AcceptChannelDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_AcceptChannelDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

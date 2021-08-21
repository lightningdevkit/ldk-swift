import LDKHeaders

public class Result_ChannelReestablishDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelReestablishDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelReestablishDecodeErrorZ(contents: LDKCResult_ChannelReestablishDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelReestablishDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
			
			public func getValue() -> ChannelReestablish? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelReestablish(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelReestablish) -> Result_ChannelReestablishDecodeErrorZ {
    	
        return Result_ChannelReestablishDecodeErrorZ(pointer: CResult_ChannelReestablishDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelReestablishDecodeErrorZ {
    	
        return Result_ChannelReestablishDecodeErrorZ(pointer: CResult_ChannelReestablishDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ChannelReestablishDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ChannelReestablishDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_ChannelReestablishDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_ChannelReestablishDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_ChannelReestablishDecodeErrorZ {
    	
        return Result_ChannelReestablishDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelReestablishDecodeErrorZ>) in
CResult_ChannelReestablishDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ChannelReestablishDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

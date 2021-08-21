public class Result_ChannelFeaturesDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelFeaturesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelFeaturesDecodeErrorZ(contents: LDKCResult_ChannelFeaturesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelFeaturesDecodeErrorZ){
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
			
			public func getValue() -> ChannelFeatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelFeatures(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelFeatures) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: CResult_ChannelFeaturesDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: CResult_ChannelFeaturesDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ChannelFeaturesDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ChannelFeaturesDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_ChannelFeaturesDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_ChannelFeaturesDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

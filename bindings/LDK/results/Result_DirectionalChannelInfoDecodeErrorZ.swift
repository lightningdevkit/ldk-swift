import LDKHeaders

public class Result_DirectionalChannelInfoDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_DirectionalChannelInfoDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_DirectionalChannelInfoDecodeErrorZ(contents: LDKCResult_DirectionalChannelInfoDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_DirectionalChannelInfoDecodeErrorZ){
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
			
			public func getValue() -> DirectionalChannelInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return DirectionalChannelInfo(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: DirectionalChannelInfo) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: CResult_DirectionalChannelInfoDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: CResult_DirectionalChannelInfoDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
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
							print("Freeing Result_DirectionalChannelInfoDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_DirectionalChannelInfoDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return Result_DirectionalChannelInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DirectionalChannelInfoDecodeErrorZ>) in
CResult_DirectionalChannelInfoDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_DirectionalChannelInfoDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

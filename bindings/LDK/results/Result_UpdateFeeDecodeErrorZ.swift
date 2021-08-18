public class Result_UpdateFeeDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_UpdateFeeDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_UpdateFeeDecodeErrorZ(contents: LDKCResult_UpdateFeeDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UpdateFeeDecodeErrorZ){
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
			
			public func getValue() -> UpdateFee? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateFee(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: UpdateFee) -> Result_UpdateFeeDecodeErrorZ {
    	
        return Result_UpdateFeeDecodeErrorZ(pointer: CResult_UpdateFeeDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_UpdateFeeDecodeErrorZ {
    	
        return Result_UpdateFeeDecodeErrorZ(pointer: CResult_UpdateFeeDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_UpdateFeeDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_UpdateFeeDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_UpdateFeeDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_UpdateFeeDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_UpdateFeeDecodeErrorZ {
    	
        return Result_UpdateFeeDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UpdateFeeDecodeErrorZ>) in
CResult_UpdateFeeDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_UpdateFeeDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

public class Result_UpdateFailMalformedHTLCDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_UpdateFailMalformedHTLCDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_UpdateFailMalformedHTLCDecodeErrorZ(contents: LDKCResult_UpdateFailMalformedHTLCDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UpdateFailMalformedHTLCDecodeErrorZ){
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
			
			public func getValue() -> UpdateFailMalformedHTLC? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateFailMalformedHTLC(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: UpdateFailMalformedHTLC) -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	
        return Result_UpdateFailMalformedHTLCDecodeErrorZ(pointer: CResult_UpdateFailMalformedHTLCDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	
        return Result_UpdateFailMalformedHTLCDecodeErrorZ(pointer: CResult_UpdateFailMalformedHTLCDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_UpdateFailMalformedHTLCDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	
        return Result_UpdateFailMalformedHTLCDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UpdateFailMalformedHTLCDecodeErrorZ>) in
CResult_UpdateFailMalformedHTLCDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

public class Result_FundingSignedDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_FundingSignedDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_FundingSignedDecodeErrorZ(contents: LDKCResult_FundingSignedDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_FundingSignedDecodeErrorZ){
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
			
			public func getValue() -> FundingSigned? {
				if self.cOpaqueStruct?.result_ok == true {
					return FundingSigned(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: FundingSigned) -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: CResult_FundingSignedDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: CResult_FundingSignedDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_FundingSignedDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_FundingSignedDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_FundingSignedDecodeErrorZ {
    	
        return Result_FundingSignedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FundingSignedDecodeErrorZ>) in
CResult_FundingSignedDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_FundingSignedDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

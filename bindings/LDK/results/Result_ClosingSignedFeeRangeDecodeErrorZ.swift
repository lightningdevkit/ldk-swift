public class Result_ClosingSignedFeeRangeDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ClosingSignedFeeRangeDecodeErrorZ(contents: LDKCResult_ClosingSignedFeeRangeDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> ClosingSignedFeeRange? {
				if self.cOpaqueStruct?.result_ok == true {
					return ClosingSignedFeeRange(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: ClosingSignedFeeRange) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
    	
        return Result_ClosingSignedFeeRangeDecodeErrorZ(pointer: CResult_ClosingSignedFeeRangeDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
    	
        return Result_ClosingSignedFeeRangeDecodeErrorZ(pointer: CResult_ClosingSignedFeeRangeDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ClosingSignedFeeRangeDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ClosingSignedFeeRangeDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ClosingSignedFeeRangeDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
    	
        return Result_ClosingSignedFeeRangeDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ClosingSignedFeeRangeDecodeErrorZ>) in
CResult_ClosingSignedFeeRangeDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

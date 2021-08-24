import LDKHeaders

public class Result_HTLCOutputInCommitmentDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_HTLCOutputInCommitmentDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_HTLCOutputInCommitmentDecodeErrorZ(contents: LDKCResult_HTLCOutputInCommitmentDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_HTLCOutputInCommitmentDecodeErrorZ){
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
			
			public func getValue() -> HTLCOutputInCommitment? {
				if self.cOpaqueStruct?.result_ok == true {
					return HTLCOutputInCommitment(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: HTLCOutputInCommitment) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return Result_HTLCOutputInCommitmentDecodeErrorZ(pointer: CResult_HTLCOutputInCommitmentDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return Result_HTLCOutputInCommitmentDecodeErrorZ(pointer: CResult_HTLCOutputInCommitmentDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_HTLCOutputInCommitmentDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_HTLCOutputInCommitmentDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_HTLCOutputInCommitmentDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_HTLCOutputInCommitmentDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return Result_HTLCOutputInCommitmentDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_HTLCOutputInCommitmentDecodeErrorZ>) in
CResult_HTLCOutputInCommitmentDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_HTLCOutputInCommitmentDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

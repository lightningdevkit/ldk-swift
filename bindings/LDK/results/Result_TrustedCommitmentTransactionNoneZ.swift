public class Result_TrustedCommitmentTransactionNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_TrustedCommitmentTransactionNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TrustedCommitmentTransactionNoneZ(contents: LDKCResult_TrustedCommitmentTransactionNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> TrustedCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return TrustedCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: TrustedCommitmentTransaction) -> Result_TrustedCommitmentTransactionNoneZ {
    	
        return Result_TrustedCommitmentTransactionNoneZ(pointer: CResult_TrustedCommitmentTransactionNoneZ_ok(o.cOpaqueStruct!));
    }

    public class func err() -> Result_TrustedCommitmentTransactionNoneZ {
    	
        return Result_TrustedCommitmentTransactionNoneZ(pointer: CResult_TrustedCommitmentTransactionNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_TrustedCommitmentTransactionNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_TrustedCommitmentTransactionNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_TrustedCommitmentTransactionNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_TrustedCommitmentTransactionNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

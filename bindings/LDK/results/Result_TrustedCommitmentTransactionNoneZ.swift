public class Result_TrustedCommitmentTransactionNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_TrustedCommitmentTransactionNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TrustedCommitmentTransactionNoneZ(contents: LDKCResult_TrustedCommitmentTransactionNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_TrustedCommitmentTransactionNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> TrustedCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return TrustedCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
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
							Bindings.print("Freeing Result_TrustedCommitmentTransactionNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_TrustedCommitmentTransactionNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

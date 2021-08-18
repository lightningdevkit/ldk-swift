import LDKHeaders

public class Result_BuiltCommitmentTransactionDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_BuiltCommitmentTransactionDecodeErrorZ(contents: LDKCResult_BuiltCommitmentTransactionDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_BuiltCommitmentTransactionDecodeErrorZ){
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
			
			public func getValue() -> BuiltCommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return BuiltCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: BuiltCommitmentTransaction) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: CResult_BuiltCommitmentTransactionDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: CResult_BuiltCommitmentTransactionDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_BuiltCommitmentTransactionDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_BuiltCommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_BuiltCommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_BuiltCommitmentTransactionDecodeErrorZ>) in
CResult_BuiltCommitmentTransactionDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_BuiltCommitmentTransactionDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

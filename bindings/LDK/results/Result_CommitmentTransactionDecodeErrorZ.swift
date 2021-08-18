public class Result_CommitmentTransactionDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_CommitmentTransactionDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CommitmentTransactionDecodeErrorZ(contents: LDKCResult_CommitmentTransactionDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CommitmentTransactionDecodeErrorZ){
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
			
			public func getValue() -> CommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return CommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: CommitmentTransaction) -> Result_CommitmentTransactionDecodeErrorZ {
    	
        return Result_CommitmentTransactionDecodeErrorZ(pointer: CResult_CommitmentTransactionDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_CommitmentTransactionDecodeErrorZ {
    	
        return Result_CommitmentTransactionDecodeErrorZ(pointer: CResult_CommitmentTransactionDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_CommitmentTransactionDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CommitmentTransactionDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_CommitmentTransactionDecodeErrorZ {
    	
        return Result_CommitmentTransactionDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CommitmentTransactionDecodeErrorZ>) in
CResult_CommitmentTransactionDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CommitmentTransactionDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

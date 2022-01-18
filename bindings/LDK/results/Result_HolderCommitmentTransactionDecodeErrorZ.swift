public class Result_HolderCommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_HolderCommitmentTransactionDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_HolderCommitmentTransactionDecodeErrorZ(contents: LDKCResult_HolderCommitmentTransactionDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_HolderCommitmentTransactionDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_HolderCommitmentTransactionDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
		public func getValue() throws -> HolderCommitmentTransaction {
			if self.cOpaqueStruct?.result_ok == true {
				return HolderCommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
			}
			throw Bindings.Error.decodeError(DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok(o: HolderCommitmentTransaction) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: CResult_HolderCommitmentTransactionDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: CResult_HolderCommitmentTransactionDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_HolderCommitmentTransactionDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_HolderCommitmentTransactionDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_HolderCommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_HolderCommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_HolderCommitmentTransactionDecodeErrorZ {
    	
        return Result_HolderCommitmentTransactionDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_HolderCommitmentTransactionDecodeErrorZ>) in
CResult_HolderCommitmentTransactionDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_HolderCommitmentTransactionDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

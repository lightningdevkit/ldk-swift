public class Result_FundingCreatedDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_FundingCreatedDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_FundingCreatedDecodeErrorZ(contents: LDKCResult_FundingCreatedDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_FundingCreatedDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_FundingCreatedDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
		public func getValue() throws -> FundingCreated {
			if self.cOpaqueStruct?.result_ok == true {
				return FundingCreated(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
			}
			throw Bindings.Error.decodeError(DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok(o: FundingCreated) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: CResult_FundingCreatedDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: CResult_FundingCreatedDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_FundingCreatedDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_FundingCreatedDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_FundingCreatedDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_FundingCreatedDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_FundingCreatedDecodeErrorZ>) in
CResult_FundingCreatedDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_FundingCreatedDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

public class Result_SpendableOutputDescriptorDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_SpendableOutputDescriptorDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SpendableOutputDescriptorDecodeErrorZ(contents: LDKCResult_SpendableOutputDescriptorDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SpendableOutputDescriptorDecodeErrorZ){
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
			
			public func getValue() -> SpendableOutputDescriptor? {
				if self.cOpaqueStruct?.result_ok == true {
					return SpendableOutputDescriptor(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: SpendableOutputDescriptor) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: CResult_SpendableOutputDescriptorDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: CResult_SpendableOutputDescriptorDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_SpendableOutputDescriptorDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SpendableOutputDescriptorDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SpendableOutputDescriptorDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SpendableOutputDescriptorDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SpendableOutputDescriptorDecodeErrorZ>) in
CResult_SpendableOutputDescriptorDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SpendableOutputDescriptorDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

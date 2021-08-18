public class Result_DelayedPaymentOutputDescriptorDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ(contents: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ){
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
			
			public func getValue() -> DelayedPaymentOutputDescriptor? {
				if self.cOpaqueStruct?.result_ok == true {
					return DelayedPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: DelayedPaymentOutputDescriptor) -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_DelayedPaymentOutputDescriptorDecodeErrorZ(pointer: CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_DelayedPaymentOutputDescriptorDecodeErrorZ(pointer: CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_DelayedPaymentOutputDescriptorDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ>) in
CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

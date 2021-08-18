public class Result_StaticPaymentOutputDescriptorDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZ(contents: LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZ){
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
			
			public func getValue() -> StaticPaymentOutputDescriptor? {
				if self.cOpaqueStruct?.result_ok == true {
					return StaticPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: StaticPaymentOutputDescriptor) -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_StaticPaymentOutputDescriptorDecodeErrorZ(pointer: CResult_StaticPaymentOutputDescriptorDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_StaticPaymentOutputDescriptorDecodeErrorZ(pointer: CResult_StaticPaymentOutputDescriptorDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_StaticPaymentOutputDescriptorDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_StaticPaymentOutputDescriptorDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_StaticPaymentOutputDescriptorDecodeErrorZ>) in
CResult_StaticPaymentOutputDescriptorDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

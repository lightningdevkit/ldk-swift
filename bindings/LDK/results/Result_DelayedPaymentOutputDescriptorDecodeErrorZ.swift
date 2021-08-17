import LDKHeaders

public class Result_DelayedPaymentOutputDescriptorDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ(contents: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ){
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

    public func free() -> Void {
    	
        return CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_DelayedPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_DelayedPaymentOutputDescriptorDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DelayedPaymentOutputDescriptorDecodeErrorZ>) in
CResult_DelayedPaymentOutputDescriptorDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

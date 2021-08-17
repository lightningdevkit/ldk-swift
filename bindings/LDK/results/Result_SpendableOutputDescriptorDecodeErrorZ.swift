import LDKHeaders

public class Result_SpendableOutputDescriptorDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_SpendableOutputDescriptorDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SpendableOutputDescriptorDecodeErrorZ(contents: LDKCResult_SpendableOutputDescriptorDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SpendableOutputDescriptorDecodeErrorZ){
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
			
			public func getValue() -> SpendableOutputDescriptor? {
				if self.cOpaqueStruct?.result_ok == true {
					return SpendableOutputDescriptor(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: SpendableOutputDescriptor) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: CResult_SpendableOutputDescriptorDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: CResult_SpendableOutputDescriptorDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_SpendableOutputDescriptorDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SpendableOutputDescriptorDecodeErrorZ>) in
CResult_SpendableOutputDescriptorDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

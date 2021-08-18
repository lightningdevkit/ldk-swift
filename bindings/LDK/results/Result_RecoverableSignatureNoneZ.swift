public class Result_RecoverableSignatureNoneZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_RecoverableSignatureNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_RecoverableSignatureNoneZ(contents: LDKCResult_RecoverableSignatureNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RecoverableSignatureNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKRecoverableSignature_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(serialized_form: [UInt8]) -> Result_RecoverableSignatureNoneZ {
    	
        return Result_RecoverableSignatureNoneZ(pointer: CResult_RecoverableSignatureNoneZ_ok(Bindings.new_LDKRecoverableSignature(array: serialized_form)));
    }

    public class func err() -> Result_RecoverableSignatureNoneZ {
    	
        return Result_RecoverableSignatureNoneZ(pointer: CResult_RecoverableSignatureNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_RecoverableSignatureNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_RecoverableSignatureNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_RecoverableSignatureNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_RecoverableSignatureNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_RecoverableSignatureNoneZ {
    	
        return Result_RecoverableSignatureNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RecoverableSignatureNoneZ>) in
CResult_RecoverableSignatureNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_RecoverableSignatureNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

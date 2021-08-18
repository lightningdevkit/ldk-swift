public class Result_PublicKeyErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_PublicKeyErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PublicKeyErrorZ(contents: LDKCResult_PublicKeyErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PublicKeyErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKSecp256k1Error? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_PublicKeyErrorZ {
    	
        return Result_PublicKeyErrorZ(pointer: CResult_PublicKeyErrorZ_ok(Bindings.new_LDKPublicKey(array: o)));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_PublicKeyErrorZ {
    	
        return Result_PublicKeyErrorZ(pointer: CResult_PublicKeyErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_PublicKeyErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PublicKeyErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_PublicKeyErrorZ {
    	
        return Result_PublicKeyErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PublicKeyErrorZ>) in
CResult_PublicKeyErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PublicKeyErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

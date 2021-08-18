public class Result_SecretKeyErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_SecretKeyErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SecretKeyErrorZ(contents: LDKCResult_SecretKeyErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SecretKeyErrorZ){
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
					return Bindings.LDKSecretKey_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_SecretKeyErrorZ {
    	
        return Result_SecretKeyErrorZ(pointer: CResult_SecretKeyErrorZ_ok(Bindings.new_LDKSecretKey(array: o).cOpaqueStruct!));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_SecretKeyErrorZ {
    	
        return Result_SecretKeyErrorZ(pointer: CResult_SecretKeyErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_SecretKeyErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SecretKeyErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_SecretKeyErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_SecretKeyErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

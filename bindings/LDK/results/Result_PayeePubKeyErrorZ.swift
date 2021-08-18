public class Result_PayeePubKeyErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_PayeePubKeyErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PayeePubKeyErrorZ(contents: LDKCResult_PayeePubKeyErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PayeePubKeyErrorZ){
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
			
			public func getValue() -> PayeePubKey? {
				if self.cOpaqueStruct?.result_ok == true {
					return PayeePubKey(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: PayeePubKey) -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: CResult_PayeePubKeyErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: CResult_PayeePubKeyErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_PayeePubKeyErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PayeePubKeyErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PayeePubKeyErrorZ>) in
CResult_PayeePubKeyErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PayeePubKeyErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

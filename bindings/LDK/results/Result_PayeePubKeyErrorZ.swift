public class Result_PayeePubKeyErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_PayeePubKeyErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PayeePubKeyErrorZ(contents: LDKCResult_PayeePubKeyErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PayeePubKeyErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_PayeePubKeyErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LDKSecp256k1Error? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
		public func getValue() throws -> PayeePubKey {
			if self.cOpaqueStruct?.result_ok == true {
				return PayeePubKey(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
			}
			throw Bindings.Error.ldkSecp256k1Error(self.cOpaqueStruct!.contents.err.pointee)
			// return nil
		}
		
    public class func ok(o: PayeePubKey) -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: CResult_PayeePubKeyErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
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
							Bindings.print("Freeing Result_PayeePubKeyErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PayeePubKeyErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PayeePubKeyErrorZ>) in
CResult_PayeePubKeyErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PayeePubKeyErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

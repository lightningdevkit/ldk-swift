public class Result_boolLightningErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_boolLightningErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_boolLightningErrorZ(contents: LDKCResult_boolLightningErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_boolLightningErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_boolLightningErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LightningError? {
				if self.cOpaqueStruct?.result_ok == false {
					return LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> Bool? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
    public class func ok(o: Bool) -> Result_boolLightningErrorZ {
    	
        return Result_boolLightningErrorZ(pointer: CResult_boolLightningErrorZ_ok(o));
    }

    public class func err(e: LightningError) -> Result_boolLightningErrorZ {
    	
        return Result_boolLightningErrorZ(pointer: CResult_boolLightningErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_boolLightningErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_boolLightningErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_boolLightningErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_boolLightningErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_boolLightningErrorZ {
    	
        return Result_boolLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_boolLightningErrorZ>) in
CResult_boolLightningErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_boolLightningErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

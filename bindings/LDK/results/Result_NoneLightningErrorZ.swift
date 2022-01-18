public class Result_NoneLightningErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_NoneLightningErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneLightningErrorZ(contents: LDKCResult_NoneLightningErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneLightningErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NoneLightningErrorZ, anchor: NativeTypeWrapper){
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
			
		public func getValue() throws  {
			if self.cOpaqueStruct?.result_ok == true {
				return 
			}
			throw Bindings.Error.lightningError(LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok() -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: CResult_NoneLightningErrorZ_ok());
    }

    public class func err(e: LightningError) -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: CResult_NoneLightningErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NoneLightningErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneLightningErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NoneLightningErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NoneLightningErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NoneLightningErrorZ {
    	
        return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneLightningErrorZ>) in
CResult_NoneLightningErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneLightningErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

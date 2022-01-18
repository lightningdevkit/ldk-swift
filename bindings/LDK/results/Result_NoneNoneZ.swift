public class Result_NoneNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_NoneNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneNoneZ(contents: LDKCResult_NoneNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NoneNoneZ, anchor: NativeTypeWrapper){
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

		public func getValue() throws  {
			if self.cOpaqueStruct?.result_ok == true {
				return 
			}
			throw Bindings.Error.void
			// return nil
		}
		
    public class func ok() -> Result_NoneNoneZ {
    	
        return Result_NoneNoneZ(pointer: CResult_NoneNoneZ_ok());
    }

    public class func err() -> Result_NoneNoneZ {
    	
        return Result_NoneNoneZ(pointer: CResult_NoneNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_NoneNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NoneNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NoneNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NoneNoneZ {
    	
        return Result_NoneNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneNoneZ>) in
CResult_NoneNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

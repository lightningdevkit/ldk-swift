public class Result_CVec_CVec_u8ZZNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_CVec_u8ZZNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CVec_CVec_u8ZZNoneZ(contents: LDKCResult_CVec_CVec_u8ZZNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_CVec_u8ZZNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [[UInt8]]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKCVec_CVec_u8ZZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [[UInt8]]) -> Result_CVec_CVec_u8ZZNoneZ {
    	
						let oWrapper = Bindings.new_LDKCVec_CVec_u8ZZWrapper(array: o)
						defer {
							oWrapper.noOpRetain()
						}
					
        return Result_CVec_CVec_u8ZZNoneZ(pointer: CResult_CVec_CVec_u8ZZNoneZ_ok(oWrapper.dangle().cOpaqueStruct!));
    }

    public class func err() -> Result_CVec_CVec_u8ZZNoneZ {
    	
        return Result_CVec_CVec_u8ZZNoneZ(pointer: CResult_CVec_CVec_u8ZZNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_CVec_CVec_u8ZZNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CVec_CVec_u8ZZNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CVec_CVec_u8ZZNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CVec_CVec_u8ZZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_CVec_CVec_u8ZZNoneZ {
    	
        return Result_CVec_CVec_u8ZZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CVec_CVec_u8ZZNoneZ>) in
CResult_CVec_CVec_u8ZZNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CVec_CVec_u8ZZNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

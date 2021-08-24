import LDKHeaders

public class Result_SiPrefixNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_SiPrefixNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SiPrefixNoneZ(contents: LDKCResult_SiPrefixNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SiPrefixNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> LDKSiPrefix? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
    public class func ok(o: LDKSiPrefix) -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: CResult_SiPrefixNoneZ_ok(o));
    }

    public class func err() -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: CResult_SiPrefixNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_SiPrefixNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SiPrefixNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_SiPrefixNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_SiPrefixNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_SiPrefixNoneZ {
    	
        return Result_SiPrefixNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SiPrefixNoneZ>) in
CResult_SiPrefixNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SiPrefixNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

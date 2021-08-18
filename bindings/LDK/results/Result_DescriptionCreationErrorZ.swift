public class Result_DescriptionCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_DescriptionCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_DescriptionCreationErrorZ(contents: LDKCResult_DescriptionCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_DescriptionCreationErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> Description? {
				if self.cOpaqueStruct?.result_ok == true {
					return Description(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Description) -> Result_DescriptionCreationErrorZ {
    	
        return Result_DescriptionCreationErrorZ(pointer: CResult_DescriptionCreationErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_DescriptionCreationErrorZ {
    	
        return Result_DescriptionCreationErrorZ(pointer: CResult_DescriptionCreationErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_DescriptionCreationErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_DescriptionCreationErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_DescriptionCreationErrorZ {
    	
        return Result_DescriptionCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DescriptionCreationErrorZ>) in
CResult_DescriptionCreationErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_DescriptionCreationErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

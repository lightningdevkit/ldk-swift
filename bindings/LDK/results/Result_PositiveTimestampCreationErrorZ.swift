public class Result_PositiveTimestampCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_PositiveTimestampCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PositiveTimestampCreationErrorZ(contents: LDKCResult_PositiveTimestampCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PositiveTimestampCreationErrorZ){
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
			
			public func getValue() -> PositiveTimestamp? {
				if self.cOpaqueStruct?.result_ok == true {
					return PositiveTimestamp(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: PositiveTimestamp) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_PositiveTimestampCreationErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PositiveTimestampCreationErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_PositiveTimestampCreationErrorZ {
    	
        return Result_PositiveTimestampCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PositiveTimestampCreationErrorZ>) in
CResult_PositiveTimestampCreationErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PositiveTimestampCreationErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

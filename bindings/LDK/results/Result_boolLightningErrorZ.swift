public class Result_boolLightningErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_boolLightningErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_boolLightningErrorZ(contents: LDKCResult_boolLightningErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_boolLightningErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LightningError? {
				if self.cOpaqueStruct?.result_ok == false {
					return LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee)
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
    	
        return Result_boolLightningErrorZ(pointer: CResult_boolLightningErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_boolLightningErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_boolLightningErrorZ {
    	
        return Result_boolLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_boolLightningErrorZ>) in
CResult_boolLightningErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}

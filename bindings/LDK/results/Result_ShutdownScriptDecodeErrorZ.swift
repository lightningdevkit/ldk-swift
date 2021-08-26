public class Result_ShutdownScriptDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_ShutdownScriptDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ShutdownScriptDecodeErrorZ(contents: LDKCResult_ShutdownScriptDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ShutdownScriptDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> ShutdownScript? {
				if self.cOpaqueStruct?.result_ok == true {
					return ShutdownScript(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ShutdownScript) -> Result_ShutdownScriptDecodeErrorZ {
    	
        return Result_ShutdownScriptDecodeErrorZ(pointer: CResult_ShutdownScriptDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ShutdownScriptDecodeErrorZ {
    	
        return Result_ShutdownScriptDecodeErrorZ(pointer: CResult_ShutdownScriptDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ShutdownScriptDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ShutdownScriptDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ShutdownScriptDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ShutdownScriptDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_ShutdownScriptDecodeErrorZ {
    	
        return Result_ShutdownScriptDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ShutdownScriptDecodeErrorZ>) in
CResult_ShutdownScriptDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ShutdownScriptDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

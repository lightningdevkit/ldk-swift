public class Result_ShutdownScriptInvalidShutdownScriptZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ShutdownScriptInvalidShutdownScriptZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ShutdownScriptInvalidShutdownScriptZ(contents: LDKCResult_ShutdownScriptInvalidShutdownScriptZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ShutdownScriptInvalidShutdownScriptZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> InvalidShutdownScript? {
				if self.cOpaqueStruct?.result_ok == false {
					return InvalidShutdownScript(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> ShutdownScript? {
				if self.cOpaqueStruct?.result_ok == true {
					return ShutdownScript(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ShutdownScript) -> Result_ShutdownScriptInvalidShutdownScriptZ {
    	
        return Result_ShutdownScriptInvalidShutdownScriptZ(pointer: CResult_ShutdownScriptInvalidShutdownScriptZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: InvalidShutdownScript) -> Result_ShutdownScriptInvalidShutdownScriptZ {
    	
        return Result_ShutdownScriptInvalidShutdownScriptZ(pointer: CResult_ShutdownScriptInvalidShutdownScriptZ_err(e.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ShutdownScriptInvalidShutdownScriptZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ShutdownScriptInvalidShutdownScriptZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_ShutdownScriptInvalidShutdownScriptZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_ShutdownScriptInvalidShutdownScriptZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

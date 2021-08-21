public class Result_StringErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_StringErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_StringErrorZ(contents: LDKCResult_StringErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_StringErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKSecp256k1Error? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> String? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKStr_to_string(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: String) -> Result_StringErrorZ {
    	
        return Result_StringErrorZ(pointer: CResult_StringErrorZ_ok(Bindings.new_LDKStr(string: o)));
    }

    public class func err(e: LDKSecp256k1Error) -> Result_StringErrorZ {
    	
        return Result_StringErrorZ(pointer: CResult_StringErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_StringErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_StringErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_StringErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_StringErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}

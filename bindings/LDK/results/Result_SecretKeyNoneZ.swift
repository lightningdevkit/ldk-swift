public class Result_SecretKeyNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_SecretKeyNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SecretKeyNoneZ(contents: LDKCResult_SecretKeyNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SecretKeyNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_SecretKeyNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKSecretKey_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_SecretKeyNoneZ {
    	
        return Result_SecretKeyNoneZ(pointer: CResult_SecretKeyNoneZ_ok(Bindings.new_LDKSecretKey(array: o)));
    }

    public class func err() -> Result_SecretKeyNoneZ {
    	
        return Result_SecretKeyNoneZ(pointer: CResult_SecretKeyNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_SecretKeyNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SecretKeyNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SecretKeyNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SecretKeyNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_SecretKeyNoneZ {
    	
        return Result_SecretKeyNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SecretKeyNoneZ>) in
CResult_SecretKeyNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SecretKeyNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

public class Result_SiPrefixParseErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_SiPrefixParseErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SiPrefixParseErrorZ(contents: LDKCResult_SiPrefixParseErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SiPrefixParseErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_SiPrefixParseErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> ParseError? {
				if self.cOpaqueStruct?.result_ok == false {
					return ParseError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> LDKSiPrefix? {
				if self.cOpaqueStruct?.result_ok == true {
					return self.cOpaqueStruct!.contents.result.pointee
				}
				return nil
			}
			
    public class func ok(o: LDKSiPrefix) -> Result_SiPrefixParseErrorZ {
    	
        return Result_SiPrefixParseErrorZ(pointer: CResult_SiPrefixParseErrorZ_ok(o));
    }

    public class func err(e: ParseError) -> Result_SiPrefixParseErrorZ {
    	
        return Result_SiPrefixParseErrorZ(pointer: CResult_SiPrefixParseErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_SiPrefixParseErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SiPrefixParseErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SiPrefixParseErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SiPrefixParseErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_SiPrefixParseErrorZ {
    	
        return Result_SiPrefixParseErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SiPrefixParseErrorZ>) in
CResult_SiPrefixParseErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SiPrefixParseErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

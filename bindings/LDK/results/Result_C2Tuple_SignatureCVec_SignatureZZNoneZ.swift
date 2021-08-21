public class Result_C2Tuple_SignatureCVec_SignatureZZNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ(contents: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> C2Tuple_SignatureCVec_SignatureZZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_SignatureCVec_SignatureZZ(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_SignatureCVec_SignatureZZ) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	
        return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	
        return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_C2Tuple_SignatureCVec_SignatureZZNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_C2Tuple_SignatureCVec_SignatureZZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	
        return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ>) in
CResult_C2Tuple_SignatureCVec_SignatureZZNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

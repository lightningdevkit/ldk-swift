#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_C2Tuple_SignatureSignatureZNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_C2Tuple_SignatureSignatureZNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_C2Tuple_SignatureSignatureZNoneZ(contents: LDKCResult_C2Tuple_SignatureSignatureZNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_SignatureSignatureZNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_C2Tuple_SignatureSignatureZNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> C2Tuple_SignatureSignatureZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_SignatureSignatureZ(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_SignatureSignatureZ) -> Result_C2Tuple_SignatureSignatureZNoneZ {
    	
        return Result_C2Tuple_SignatureSignatureZNoneZ(pointer: CResult_C2Tuple_SignatureSignatureZNoneZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err() -> Result_C2Tuple_SignatureSignatureZNoneZ {
    	
        return Result_C2Tuple_SignatureSignatureZNoneZ(pointer: CResult_C2Tuple_SignatureSignatureZNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_C2Tuple_SignatureSignatureZNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_C2Tuple_SignatureSignatureZNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_SignatureSignatureZNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_SignatureSignatureZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_C2Tuple_SignatureSignatureZNoneZ {
    	
        return Result_C2Tuple_SignatureSignatureZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureSignatureZNoneZ>) in
CResult_C2Tuple_SignatureSignatureZNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_C2Tuple_SignatureSignatureZNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

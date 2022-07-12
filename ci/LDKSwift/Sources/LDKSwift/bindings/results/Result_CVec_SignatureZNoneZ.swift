#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_CVec_SignatureZNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_CVec_SignatureZNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CVec_SignatureZNoneZ(contents: LDKCResult_CVec_SignatureZNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_SignatureZNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_CVec_SignatureZNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> [[UInt8]]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKCVec_SignatureZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee, deallocate: false)
				}
				return nil
			}
			
    public class func ok(o: [[UInt8]]) -> Result_CVec_SignatureZNoneZ {
    	
						let oWrapper = Bindings.new_LDKCVec_SignatureZWrapper(array: o)
						defer {
							oWrapper.noOpRetain()
						}
					
        return Result_CVec_SignatureZNoneZ(pointer: CResult_CVec_SignatureZNoneZ_ok(oWrapper.dangle().cOpaqueStruct!));
    }

    public class func err() -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: CResult_CVec_SignatureZNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_CVec_SignatureZNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CVec_SignatureZNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CVec_SignatureZNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CVec_SignatureZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CVec_SignatureZNoneZ>) in
CResult_CVec_SignatureZNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CVec_SignatureZNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}

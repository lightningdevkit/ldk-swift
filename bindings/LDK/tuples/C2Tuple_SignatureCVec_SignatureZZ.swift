public class C2Tuple_SignatureCVec_SignatureZZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_SignatureCVec_SignatureZZ?

    public init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_SignatureCVec_SignatureZZ {
    	
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_SignatureCVec_SignatureZZ>) in
C2Tuple_SignatureCVec_SignatureZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_SignatureCVec_SignatureZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [[UInt8]]) -> C2Tuple_SignatureCVec_SignatureZZ {
    	
						let bWrapper = Bindings.new_LDKCVec_SignatureZWrapper(array: b)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: C2Tuple_SignatureCVec_SignatureZZ_new(Bindings.new_LDKSignature(array: a), bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_SignatureCVec_SignatureZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_SignatureCVec_SignatureZZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_SignatureCVec_SignatureZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_SignatureCVec_SignatureZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}

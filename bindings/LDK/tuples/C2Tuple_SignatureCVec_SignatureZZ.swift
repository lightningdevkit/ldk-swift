import LDKHeaders

public class C2Tuple_SignatureCVec_SignatureZZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_SignatureCVec_SignatureZZ?;

    public init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
    	
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: C2Tuple_SignatureCVec_SignatureZZ_new(Bindings.new_LDKSignature(array: a), Bindings.new_LDKCVec_SignatureZ(array: b)));
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
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}

public class C2Tuple_SignatureCVec_SignatureZZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_SignatureCVec_SignatureZZ?;

    public init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_SignatureCVec_SignatureZZ {
    	
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_SignatureCVec_SignatureZZ>) in
C2Tuple_SignatureCVec_SignatureZZ_clone(origPointer)
});
    }

    public class func new(a: [UInt8], b: [[UInt8]]) -> C2Tuple_SignatureCVec_SignatureZZ {
    	
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: C2Tuple_SignatureCVec_SignatureZZ_new(Bindings.new_LDKSignature(array: a), Bindings.new_LDKCVec_SignatureZ(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_SignatureCVec_SignatureZZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

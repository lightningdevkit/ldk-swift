public class C2Tuple_SignatureCVec_SignatureZZ {

    var cOpaqueStruct: LDKC2Tuple_SignatureCVec_SignatureZZ?;

    public init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone(orig: C2Tuple_SignatureCVec_SignatureZZ) -> C2Tuple_SignatureCVec_SignatureZZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC2Tuple_SignatureCVec_SignatureZZ>) in
							
			pointer
						
		}
					
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: C2Tuple_SignatureCVec_SignatureZZ_clone(origPointer));
    }

    public func new(a: [UInt8], b: [[UInt8]]) -> C2Tuple_SignatureCVec_SignatureZZ {
    	
        return C2Tuple_SignatureCVec_SignatureZZ(pointer: C2Tuple_SignatureCVec_SignatureZZ_new(Bindings.new_LDKSignature(array: a), Bindings.new_LDKCVec_SignatureZ(array: b)));
    }

				
	deinit {
					
					
		C2Tuple_SignatureCVec_SignatureZZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

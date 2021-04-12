class C2Tuple_SignatureCVec_SignatureZZ {

    var cTuple: LDKC2Tuple_SignatureCVec_SignatureZZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_SignatureCVec_SignatureZZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: TwoTuple<[U]>) -> TwoTuple<[U]> {
    	
						
		let origPointer = withUnsafePointer(to: orig.cTuple!) { (pointer: UnsafePointer<LDKC2Tuple_SignatureCVec_SignatureZZ>) in
							
			pointer
						
		}
					
        return C2Tuple_SignatureCVec_SignatureZZ_clone(origPointer);
    }

    func new(a: [U], b: [[U]]) -> TwoTuple<[U]> {
    	
        return C2Tuple_SignatureCVec_SignatureZZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_SignatureCVec_SignatureZZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

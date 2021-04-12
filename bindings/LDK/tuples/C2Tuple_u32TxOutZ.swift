class C2Tuple_u32TxOutZ {

    var cTuple: LDKC2Tuple_u32TxOutZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_u32TxOutZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: TwoTuple<U>) -> TwoTuple<U> {
    	
						
		let origPointer = withUnsafePointer(to: orig.cTuple!) { (pointer: UnsafePointer<LDKC2Tuple_u32TxOutZ>) in
							
			pointer
						
		}
					
        return C2Tuple_u32TxOutZ_clone(origPointer);
    }

    func new(a: U, b: TxOut) -> TwoTuple<U> {
    	
        return C2Tuple_u32TxOutZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_u32TxOutZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

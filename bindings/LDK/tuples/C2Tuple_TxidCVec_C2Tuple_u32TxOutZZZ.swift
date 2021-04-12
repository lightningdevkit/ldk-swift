class C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {

    var cTuple: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: [U], b: [TwoTuple<U>]) -> TwoTuple<[U]> {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

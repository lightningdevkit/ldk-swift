class C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {

    var cTuple: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: [U], b: [TwoTuple<U>]) -> TwoTuple<[U]> {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

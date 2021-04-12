class C2Tuple_usizeTransactionZ {

    var cTuple: LDKC2Tuple_usizeTransactionZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_usizeTransactionZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: U, b: [U]) -> TwoTuple<U> {
    	
        return C2Tuple_usizeTransactionZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_usizeTransactionZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

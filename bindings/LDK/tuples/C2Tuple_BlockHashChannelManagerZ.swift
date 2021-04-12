class C2Tuple_BlockHashChannelManagerZ {

    var cTuple: LDKC2Tuple_BlockHashChannelManagerZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_BlockHashChannelManagerZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: [U], b: ChannelManager) -> TwoTuple<[U]> {
    	
        return C2Tuple_BlockHashChannelManagerZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_BlockHashChannelManagerZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

class C2Tuple_BlockHashChannelMonitorZ {

    var cTuple: LDKC2Tuple_BlockHashChannelMonitorZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_BlockHashChannelMonitorZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func new(a: [U], b: ChannelMonitor) -> TwoTuple<[U]> {
    	
        return C2Tuple_BlockHashChannelMonitorZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_BlockHashChannelMonitorZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

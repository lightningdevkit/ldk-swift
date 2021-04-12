class C2Tuple_u32ScriptZ {

    var cTuple: LDKC2Tuple_u32ScriptZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_u32ScriptZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: TwoTuple<U>) -> TwoTuple<U> {
    	
						
		let origPointer = withUnsafePointer(to: orig.cTuple!) { (pointer: UnsafePointer<LDKC2Tuple_u32ScriptZ>) in
							
			pointer
						
		}
					
        return C2Tuple_u32ScriptZ_clone(origPointer);
    }

    func new(a: U, b: [U]) -> TwoTuple<U> {
    	
        return C2Tuple_u32ScriptZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_u32ScriptZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

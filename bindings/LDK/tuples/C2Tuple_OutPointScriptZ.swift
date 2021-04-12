class C2Tuple_OutPointScriptZ {

    var cTuple: LDKC2Tuple_OutPointScriptZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC2Tuple_OutPointScriptZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: TwoTuple<OutPoint>) -> TwoTuple<OutPoint> {
    	
						
		let origPointer = withUnsafePointer(to: orig.cTuple!) { (pointer: UnsafePointer<LDKC2Tuple_OutPointScriptZ>) in
							
			pointer
						
		}
					
        return C2Tuple_OutPointScriptZ_clone(origPointer);
    }

    func new(a: OutPoint, b: [U]) -> TwoTuple<OutPoint> {
    	
        return C2Tuple_OutPointScriptZ_new(a, b);
    }

				
	deinit {
					
					
		C2Tuple_OutPointScriptZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}

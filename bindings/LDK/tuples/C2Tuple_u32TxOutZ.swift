class C2Tuple_u32TxOutZ {

    var cOpaqueStruct: LDKC2Tuple_u32TxOutZ?;

    init(pointer: LDKC2Tuple_u32TxOutZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: C2Tuple_u32TxOutZ) -> C2Tuple_u32TxOutZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC2Tuple_u32TxOutZ>) in
							
			pointer
						
		}
					
        return C2Tuple_u32TxOutZ(pointer: C2Tuple_u32TxOutZ_clone(origPointer));
    }

    func new(a: UInt32, b: TxOut) -> C2Tuple_u32TxOutZ {
    	
        return C2Tuple_u32TxOutZ(pointer: C2Tuple_u32TxOutZ_new(a, b.cOpaqueStruct!));
    }

				
	deinit {
					
					
		C2Tuple_u32TxOutZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

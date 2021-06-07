public class C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ?;

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone(orig: C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ) -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>) in
							
			pointer
						
		}
					
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_clone(origPointer));
    }

    public func new(a: [UInt8], b: [LDKC2Tuple_u32TxOutZ]) -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKCVec_C2Tuple_u32TxOutZZ(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

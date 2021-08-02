public class C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ?;

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>) in
C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone(origPointer)
});
    }

    public class func new(a: [UInt8], b: [LDKC2Tuple_u32ScriptZ]) -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKCVec_C2Tuple_u32ScriptZZ(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

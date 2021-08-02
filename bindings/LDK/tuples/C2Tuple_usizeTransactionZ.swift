public class C2Tuple_usizeTransactionZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_usizeTransactionZ?;

    public init(pointer: LDKC2Tuple_usizeTransactionZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_usizeTransactionZ {
    	
        return C2Tuple_usizeTransactionZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_usizeTransactionZ>) in
C2Tuple_usizeTransactionZ_clone(origPointer)
});
    }

    public class func new(a: UInt, b: [UInt8]) -> C2Tuple_usizeTransactionZ {
    	
        return C2Tuple_usizeTransactionZ(pointer: C2Tuple_usizeTransactionZ_new(a, Bindings.new_LDKTransaction(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_usizeTransactionZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

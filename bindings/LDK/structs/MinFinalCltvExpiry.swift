public class MinFinalCltvExpiry {

    public internal(set) var cOpaqueStruct: LDKMinFinalCltvExpiry?;

	

    public init(pointer: LDKMinFinalCltvExpiry){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: MinFinalCltvExpiry, b: MinFinalCltvExpiry) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_eq(aPointer, bPointer)
}
};
    }

    public func clone(orig: MinFinalCltvExpiry) -> MinFinalCltvExpiry {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry(pointer: MinFinalCltvExpiry_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		MinFinalCltvExpiry_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

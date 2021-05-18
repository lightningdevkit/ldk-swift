public class MinFinalCltvExpiry {

    var cOpaqueStruct: LDKMinFinalCltvExpiry?;

	

    public init(pointer: LDKMinFinalCltvExpiry){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

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

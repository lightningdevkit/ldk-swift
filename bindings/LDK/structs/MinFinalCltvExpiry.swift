class MinFinalCltvExpiry {

    var cOpaqueStruct: LDKMinFinalCltvExpiry?;

	

    init(pointer: LDKMinFinalCltvExpiry){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: MinFinalCltvExpiry) -> MinFinalCltvExpiry {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
							
			pointer
						
		}
					
        return MinFinalCltvExpiry(pointer: MinFinalCltvExpiry_clone(origPointer));
    }

				
	deinit {
					
					
		MinFinalCltvExpiry_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

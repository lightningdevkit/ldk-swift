class PayeePubKey {

    var cOpaqueStruct: LDKPayeePubKey?;

	

    init(pointer: LDKPayeePubKey){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: PayeePubKey) -> PayeePubKey {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPayeePubKey>) in
							
			pointer
						
		}
					
        return PayeePubKey(pointer: PayeePubKey_clone(origPointer));
    }

				
	deinit {
					
					
		PayeePubKey_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

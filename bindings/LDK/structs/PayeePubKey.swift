public class PayeePubKey {

    var cOpaqueStruct: LDKPayeePubKey?;

	

    public init(pointer: LDKPayeePubKey){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: PayeePubKey) -> PayeePubKey {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPayeePubKey>) in
PayeePubKey(pointer: PayeePubKey_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		PayeePubKey_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

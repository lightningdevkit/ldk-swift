public class Description {

    public internal(set) var cOpaqueStruct: LDKDescription?;

	

    public init(pointer: LDKDescription){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: Description) -> Description {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDescription>) in
Description(pointer: Description_clone(origPointer))
};
    }

    public func new(description: String) -> Result_DescriptionCreationErrorZ {
    	
        return Result_DescriptionCreationErrorZ(pointer: Description_new(Bindings.new_LDKStr(string: description)));
    }

    public func into_inner() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: Description_into_inner(self.cOpaqueStruct!));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		Description_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

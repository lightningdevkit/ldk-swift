public class Description {

    var cOpaqueStruct: LDKDescription?;

	

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

    public func into_inner(this_arg: Description) -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: Description_into_inner(this_arg.cOpaqueStruct!));
    }

				
	deinit {
					
					
		Description_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

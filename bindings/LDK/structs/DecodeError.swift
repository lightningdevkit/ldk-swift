public class DecodeError {

    var cOpaqueStruct: LDKDecodeError?;

	

    public init(pointer: LDKDecodeError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: DecodeError) -> DecodeError {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDecodeError>) in
DecodeError(pointer: DecodeError_clone(origPointer))
};
    }

				
	deinit {
					
					
		DecodeError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

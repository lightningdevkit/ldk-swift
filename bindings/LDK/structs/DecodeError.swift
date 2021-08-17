import LDKHeaders

public class DecodeError {

    public internal(set) var cOpaqueStruct: LDKDecodeError?;

	

    public init(pointer: LDKDecodeError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> DecodeError {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDecodeError>) in
DecodeError(pointer: DecodeError_clone(origPointer))
};
    }

				
	deinit {
					
					
					
		DecodeError_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

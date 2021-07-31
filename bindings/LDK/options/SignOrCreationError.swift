public class SignOrCreationError {

    public internal(set) var cOpaqueStruct: LDKSignOrCreationError?;

	

    public init(pointer: LDKSignOrCreationError){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum SignOrCreationErrorValueType {
					case CreationError
				}
				
				public func getValueType() -> SignOrCreationErrorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKSignOrCreationError_CreationError:
						return .CreationError
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsCreationError() -> LDKCreationError? {
						if self.cOpaqueStruct?.tag != LDKSignOrCreationError_CreationError {
							return nil
						}
						return self.cOpaqueStruct!.creation_error
					}
				
			
    public func free() -> Void {
    	
        return SignOrCreationError_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> SignOrCreationError {
    	
        return SignOrCreationError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSignOrCreationError>) in
SignOrCreationError_clone(origPointer)
});
    }

    public func eq(a: SignOrCreationError, b: SignOrCreationError) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKSignOrCreationError>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKSignOrCreationError>) in
SignOrCreationError_eq(aPointer, bPointer)
}
};
    }

    public func to_str() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKSignOrCreationError>) in
SignOrCreationError_to_str(oPointer)
});
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}

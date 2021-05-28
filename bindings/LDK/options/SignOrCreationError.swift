public class SignOrCreationError {

    var cOpaqueStruct: LDKSignOrCreationError?;

	

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
				
			
    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}

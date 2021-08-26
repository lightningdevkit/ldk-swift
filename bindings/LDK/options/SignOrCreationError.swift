public class SignOrCreationError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKSignOrCreationError?

	

    public init(pointer: LDKSignOrCreationError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
				
			
    internal func free() -> Void {
    	
        return SignOrCreationError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> SignOrCreationError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing SignOrCreationError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SignOrCreationError \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> SignOrCreationError {
    	
        return SignOrCreationError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSignOrCreationError>) in
SignOrCreationError_clone(origPointer)
});
    }

					internal func danglingClone() -> SignOrCreationError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func sign_error() -> SignOrCreationError {
    	
        return SignOrCreationError(pointer: SignOrCreationError_sign_error());
    }

    public class func creation_error(a: LDKCreationError) -> SignOrCreationError {
    	
        return SignOrCreationError(pointer: SignOrCreationError_creation_error(a));
    }

    public class func eq(a: SignOrCreationError, b: SignOrCreationError) -> Bool {
    	
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

public class DecodeError {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKDecodeError?;


	

    public init(pointer: LDKDecodeError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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

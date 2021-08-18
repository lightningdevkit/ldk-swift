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
    	
        return DecodeError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDecodeError>) in
DecodeError_clone(origPointer)
});
    }

					internal func danglingClone() -> DecodeError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return DecodeError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DecodeError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

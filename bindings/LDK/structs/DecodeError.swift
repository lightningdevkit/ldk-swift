public class DecodeError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKDecodeError?


	

    public init(pointer: LDKDecodeError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
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
							print("Freeing DecodeError \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing DecodeError \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

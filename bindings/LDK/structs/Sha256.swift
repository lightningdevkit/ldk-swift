public class Sha256: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKSha256?


	

    public init(pointer: LDKSha256){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: Sha256, b: Sha256) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKSha256>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKSha256>) in
Sha256_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> Sha256 {
    	
        return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSha256>) in
Sha256_clone(origPointer)
});
    }

					internal func danglingClone() -> Sha256 {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return Sha256_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Sha256 {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Sha256 \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Sha256 \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

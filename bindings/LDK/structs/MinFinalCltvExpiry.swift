import LDKHeaders

public class MinFinalCltvExpiry: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKMinFinalCltvExpiry?


	

    public init(pointer: LDKMinFinalCltvExpiry){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: MinFinalCltvExpiry, b: MinFinalCltvExpiry) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> MinFinalCltvExpiry {
    	
        return MinFinalCltvExpiry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_clone(origPointer)
});
    }

					internal func danglingClone() -> MinFinalCltvExpiry {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return MinFinalCltvExpiry_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MinFinalCltvExpiry {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing MinFinalCltvExpiry \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing MinFinalCltvExpiry \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

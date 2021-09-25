public class MinFinalCltvExpiry: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMinFinalCltvExpiry?


	

    public init(pointer: LDKMinFinalCltvExpiry){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMinFinalCltvExpiry, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

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
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_hash(oPointer)
};
    }

    public class func eq(a: MinFinalCltvExpiry, b: MinFinalCltvExpiry) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_eq(aPointer, bPointer)
}
};
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
							Bindings.print("Freeing MinFinalCltvExpiry \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MinFinalCltvExpiry \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

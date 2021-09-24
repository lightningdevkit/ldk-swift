public class PayeePubKey: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPayeePubKey?


	

    public init(pointer: LDKPayeePubKey){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPayeePubKey, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> PayeePubKey {
    	
        return PayeePubKey(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPayeePubKey>) in
PayeePubKey_clone(origPointer)
});
    }

					internal func danglingClone() -> PayeePubKey {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKPayeePubKey>) in
PayeePubKey_hash(oPointer)
};
    }

    public class func eq(a: PayeePubKey, b: PayeePubKey) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPayeePubKey>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPayeePubKey>) in
PayeePubKey_eq(aPointer, bPointer)
}
};
    }

    internal func free() -> Void {
    	
        return PayeePubKey_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PayeePubKey {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PayeePubKey \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PayeePubKey \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

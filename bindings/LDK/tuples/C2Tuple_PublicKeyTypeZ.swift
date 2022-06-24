public class C2Tuple_PublicKeyTypeZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_PublicKeyTypeZ?

    public init(pointer: LDKC2Tuple_PublicKeyTypeZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_PublicKeyTypeZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_PublicKeyTypeZ {
    	
        return C2Tuple_PublicKeyTypeZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_PublicKeyTypeZ>) in
C2Tuple_PublicKeyTypeZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_PublicKeyTypeZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: BindingsType) -> C2Tuple_PublicKeyTypeZ {
    	
        return C2Tuple_PublicKeyTypeZ(pointer: C2Tuple_PublicKeyTypeZ_new(Bindings.new_LDKPublicKey(array: a), b.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_PublicKeyTypeZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_PublicKeyTypeZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_PublicKeyTypeZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_PublicKeyTypeZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> BindingsType {
					return BindingsType(pointer: self.cOpaqueStruct!.b, anchor: self);
				}
			
    /* TUPLE_METHODS_END */

}

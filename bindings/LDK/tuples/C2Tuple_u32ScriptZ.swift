public class C2Tuple_u32ScriptZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_u32ScriptZ?

    public init(pointer: LDKC2Tuple_u32ScriptZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_u32ScriptZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_u32ScriptZ {
    	
        return C2Tuple_u32ScriptZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_u32ScriptZ>) in
C2Tuple_u32ScriptZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_u32ScriptZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: UInt32, b: [UInt8]) -> C2Tuple_u32ScriptZ {
    	
						let bWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: b)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_u32ScriptZ(pointer: C2Tuple_u32ScriptZ_new(a, bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_u32ScriptZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_u32ScriptZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_u32ScriptZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_u32ScriptZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> UInt32 {
					return self.cOpaqueStruct!.a;
				}
			
				public func getB() -> [UInt8] {
					return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.b, deallocate: false);
				}
			
    /* TUPLE_METHODS_END */

}

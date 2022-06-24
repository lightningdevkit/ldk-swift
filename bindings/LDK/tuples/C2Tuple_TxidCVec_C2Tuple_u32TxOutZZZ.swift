public class C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ?

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>) in
C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [C2Tuple_u32TxOutZ]) -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
    	
							let bUnwrapped = b.map { (bCurrentValue) in
							bCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let bWrapper = Bindings.new_LDKCVec_C2Tuple_u32TxOutZZWrapper(array: bUnwrapped)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> [C2Tuple_u32TxOutZ] {
					return Bindings.LDKCVec_C2Tuple_u32TxOutZZ_to_array(nativeType: self.cOpaqueStruct!.b, deallocate: false)
						
						.map { (cOpaqueStruct) in
							C2Tuple_u32TxOutZ(pointer: cOpaqueStruct).dangle()
						}
					;
				}
			
    /* TUPLE_METHODS_END */

}

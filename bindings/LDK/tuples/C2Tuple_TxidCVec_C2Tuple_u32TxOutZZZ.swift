public class C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ?;

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
				

    public class func new(a: [UInt8], b: [LDKC2Tuple_u32TxOutZ]) -> C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), Bindings.new_LDKCVec_C2Tuple_u32TxOutZZ(array: b)));
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
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}

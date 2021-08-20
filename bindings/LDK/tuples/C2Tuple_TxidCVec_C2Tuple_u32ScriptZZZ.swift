public class C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ?;

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>) in
C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [LDKC2Tuple_u32ScriptZ]) -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
						let bWrapper = Bindings.new_LDKCVec_C2Tuple_u32ScriptZZWrapper(array: b)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}

public class C2Tuple_u32TxOutZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKC2Tuple_u32TxOutZ?

    public init(pointer: LDKC2Tuple_u32TxOutZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_u32TxOutZ {
    	
        return C2Tuple_u32TxOutZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_u32TxOutZ>) in
C2Tuple_u32TxOutZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_u32TxOutZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: UInt32, b: LDKTxOut) -> C2Tuple_u32TxOutZ {
    	
        return C2Tuple_u32TxOutZ(pointer: C2Tuple_u32TxOutZ_new(a, b));
    }

    internal func free() -> Void {
    	
        return C2Tuple_u32TxOutZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_u32TxOutZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing C2Tuple_u32TxOutZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing C2Tuple_u32TxOutZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}

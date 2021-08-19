public class C2Tuple_OutPointScriptZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_OutPointScriptZ?;

    public init(pointer: LDKC2Tuple_OutPointScriptZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_OutPointScriptZ {
    	
        return C2Tuple_OutPointScriptZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_OutPointScriptZ>) in
C2Tuple_OutPointScriptZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_OutPointScriptZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: OutPoint, b: [UInt8]) -> C2Tuple_OutPointScriptZ {
    	
        return C2Tuple_OutPointScriptZ(pointer: C2Tuple_OutPointScriptZ_new(a.danglingClone().cOpaqueStruct!, Bindings.new_LDKCVec_u8ZWrapper(array: b).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_OutPointScriptZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_OutPointScriptZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing C2Tuple_OutPointScriptZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing C2Tuple_OutPointScriptZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}

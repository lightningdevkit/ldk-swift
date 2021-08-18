public class C2Tuple_u32ScriptZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_u32ScriptZ?;

    public init(pointer: LDKC2Tuple_u32ScriptZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_u32ScriptZ {
    	
        return C2Tuple_u32ScriptZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_u32ScriptZ>) in
C2Tuple_u32ScriptZ_clone(origPointer)
});
    }

    public class func new(a: UInt32, b: [UInt8]) -> C2Tuple_u32ScriptZ {
    	
        return C2Tuple_u32ScriptZ(pointer: C2Tuple_u32ScriptZ_new(a, Bindings.new_LDKCVec_u8Z(array: b)));
    }

				
	deinit {
					
					
					
		C2Tuple_u32ScriptZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}

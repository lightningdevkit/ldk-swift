public class MinFinalCltvExpiry {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKMinFinalCltvExpiry?;


	

    public init(pointer: LDKMinFinalCltvExpiry){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: MinFinalCltvExpiry, b: MinFinalCltvExpiry) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> MinFinalCltvExpiry {
    	
        return MinFinalCltvExpiry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_clone(origPointer)
});
    }

				
	deinit {
					
					
					
		MinFinalCltvExpiry_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

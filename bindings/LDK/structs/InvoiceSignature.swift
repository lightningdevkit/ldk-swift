public class InvoiceSignature {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKInvoiceSignature?;


	

    public init(pointer: LDKInvoiceSignature){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: InvoiceSignature, b: InvoiceSignature) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInvoiceSignature>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> InvoiceSignature {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature(pointer: InvoiceSignature_clone(origPointer))
};
    }

				
	deinit {
					
					
					
		InvoiceSignature_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

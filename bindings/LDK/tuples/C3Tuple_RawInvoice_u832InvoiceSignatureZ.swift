public class C3Tuple_RawInvoice_u832InvoiceSignatureZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ?;

    public init(pointer: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ>) in
C3Tuple_RawInvoice_u832InvoiceSignatureZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: RawInvoice, b: [UInt8], c: InvoiceSignature) -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: C3Tuple_RawInvoice_u832InvoiceSignatureZ_new(a.danglingClone().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: b), c.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing C3Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing C3Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}

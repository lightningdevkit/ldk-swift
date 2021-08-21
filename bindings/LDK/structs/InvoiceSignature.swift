import LDKHeaders

public class InvoiceSignature: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKInvoiceSignature?


	

    public init(pointer: LDKInvoiceSignature){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
    	
        return InvoiceSignature(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoiceSignature>) in
InvoiceSignature_clone(origPointer)
});
    }

					internal func danglingClone() -> InvoiceSignature {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return InvoiceSignature_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> InvoiceSignature {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing InvoiceSignature \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing InvoiceSignature \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

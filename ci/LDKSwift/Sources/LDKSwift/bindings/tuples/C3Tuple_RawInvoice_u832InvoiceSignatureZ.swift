#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C3Tuple_RawInvoice_u832InvoiceSignatureZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ?

    public init(pointer: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
							Bindings.print("Freeing C3Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C3Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> RawInvoice {
					return RawInvoice(pointer: self.cOpaqueStruct!.a, anchor: self);
				}
			
				public func getB() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.b);
				}
			
				public func getC() -> InvoiceSignature {
					return InvoiceSignature(pointer: self.cOpaqueStruct!.c, anchor: self);
				}
			
    /* TUPLE_METHODS_END */

}

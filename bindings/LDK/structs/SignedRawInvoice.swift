public class SignedRawInvoice {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKSignedRawInvoice?;


	

    public init(pointer: LDKSignedRawInvoice){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: SignedRawInvoice, b: SignedRawInvoice) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKSignedRawInvoice>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> SignedRawInvoice {
    	
        return SignedRawInvoice(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_clone(origPointer)
});
    }

					internal func danglingClone() -> SignedRawInvoice {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func into_parts() -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: SignedRawInvoice_into_parts(self.clone().cOpaqueStruct!));
    }

    public func raw_invoice() -> RawInvoice {
    	
        return RawInvoice(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_raw_invoice(this_argPointer)
});
    }

    public func hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_hash(this_argPointer)
}.pointee);
    }

    public func signature() -> InvoiceSignature {
    	
        return InvoiceSignature(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_signature(this_argPointer)
});
    }

    public func recover_payee_pub_key() -> Result_PayeePubKeyErrorZ {
    	
        return Result_PayeePubKeyErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_recover_payee_pub_key(this_argPointer)
});
    }

    public func check_signature() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_check_signature(this_argPointer)
};
    }

    public class func from_str(s: String) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: SignedRawInvoice_from_str(Bindings.new_LDKStr(string: s)));
    }

    public func to_str() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_to_str(oPointer)
});
    }

    internal func free() -> Void {
    	
        return SignedRawInvoice_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> SignedRawInvoice {
        				self.dangling = true
						return self
					}
					
					deinit {
						self.free()
					}
				

    /* STRUCT_METHODS_END */

}

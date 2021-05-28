public class SignedRawInvoice {

    public internal(set) var cOpaqueStruct: LDKSignedRawInvoice?;

	

    public init(pointer: LDKSignedRawInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: SignedRawInvoice) -> SignedRawInvoice {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice(pointer: SignedRawInvoice_clone(origPointer))
};
    }

    public func into_parts() -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: SignedRawInvoice_into_parts(self.cOpaqueStruct!));
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

    public func from_str(s: String) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: SignedRawInvoice_from_str(Bindings.new_LDKStr(string: s)));
    }

    public func to_str(o: SignedRawInvoice) -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKSignedRawInvoice>) in
SignedRawInvoice_to_str(oPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		SignedRawInvoice_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

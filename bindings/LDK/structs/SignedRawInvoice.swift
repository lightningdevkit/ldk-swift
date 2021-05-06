public class SignedRawInvoice {

    var cOpaqueStruct: LDKSignedRawInvoice?;

	

    public init(pointer: LDKSignedRawInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: SignedRawInvoice) -> SignedRawInvoice {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return SignedRawInvoice(pointer: SignedRawInvoice_clone(origPointer));
    }

    public func into_parts(this_arg: SignedRawInvoice) -> C3Tuple_RawInvoice_u832InvoiceSignatureZ {
    	
        return C3Tuple_RawInvoice_u832InvoiceSignatureZ(pointer: SignedRawInvoice_into_parts(this_arg.cOpaqueStruct!));
    }

    public func raw_invoice(this_arg: SignedRawInvoice) -> RawInvoice {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return RawInvoice(pointer: SignedRawInvoice_raw_invoice(this_argPointer));
    }

    public func hash(this_arg: SignedRawInvoice) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return SignedRawInvoice_hash(this_argPointer).pointee;
    }

    public func signature(this_arg: SignedRawInvoice) -> InvoiceSignature {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return InvoiceSignature(pointer: SignedRawInvoice_signature(this_argPointer));
    }

    public func recover_payee_pub_key(this_arg: SignedRawInvoice) -> Result_PayeePubKeyErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return Result_PayeePubKeyErrorZ(pointer: SignedRawInvoice_recover_payee_pub_key(this_argPointer));
    }

    public func check_signature(this_arg: SignedRawInvoice) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return SignedRawInvoice_check_signature(this_argPointer);
    }

    public func from_str(s: String) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: SignedRawInvoice_from_str(Bindings.new_LDKStr(string: s)));
    }

    public func to_str(o: SignedRawInvoice) -> String {
    	
						
		let oPointer = withUnsafePointer(to: o.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSignedRawInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKStr_to_string(nativeType: SignedRawInvoice_to_str(oPointer));
    }

				
	deinit {
					
					
		SignedRawInvoice_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

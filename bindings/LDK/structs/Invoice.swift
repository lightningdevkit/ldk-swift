class Invoice {

    var cOpaqueStruct: LDKInvoice?;

	

    init(pointer: LDKInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: Invoice) -> Invoice {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice(pointer: Invoice_clone(origPointer));
    }

    func into_signed_raw(this_arg: Invoice) -> SignedRawInvoice {
    	
        return SignedRawInvoice(pointer: Invoice_into_signed_raw(this_arg.cOpaqueStruct!));
    }

    func check_signature(this_arg: Invoice) -> Result_NoneSemanticErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Result_NoneSemanticErrorZ(pointer: Invoice_check_signature(this_argPointer));
    }

    func from_signed(signed_invoice: SignedRawInvoice) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: Invoice_from_signed(signed_invoice.cOpaqueStruct!));
    }

    func timestamp(this_arg: Invoice) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_timestamp(this_argPointer);
    }

    func payment_hash(this_arg: Invoice) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_payment_hash(this_argPointer).pointee;
    }

    func payee_pub_key(this_arg: Invoice) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: Invoice_payee_pub_key(this_argPointer));
    }

    func payment_secret(this_arg: Invoice) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: Invoice_payment_secret(this_argPointer));
    }

    func features(this_arg: Invoice) -> InvoiceFeatures {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return InvoiceFeatures(pointer: Invoice_features(this_argPointer));
    }

    func recover_payee_pub_key(this_arg: Invoice) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: Invoice_recover_payee_pub_key(this_argPointer));
    }

    func expiry_time(this_arg: Invoice) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_expiry_time(this_argPointer);
    }

    func min_final_cltv_expiry(this_arg: Invoice) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_min_final_cltv_expiry(this_argPointer);
    }

    func routes(this_arg: Invoice) -> [LDKRouteHint] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: Invoice_routes(this_argPointer));
    }

    func currency(this_arg: Invoice) -> LDKCurrency {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_currency(this_argPointer);
    }

    func amount_pico_btc(this_arg: Invoice) -> Option_u64Z {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Option_u64Z(pointer: Invoice_amount_pico_btc(this_argPointer));
    }

    func from_str(s: String) -> Result_InvoiceNoneZ {
    	
        return Result_InvoiceNoneZ(pointer: Invoice_from_str(s));
    }

    func to_str(o: Invoice) -> String {
    	
						
		let oPointer = withUnsafePointer(to: o.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInvoice>) in
							
			pointer
						
		}
					
        return Invoice_to_str(oPointer);
    }

				
	deinit {
					
					
		Invoice_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

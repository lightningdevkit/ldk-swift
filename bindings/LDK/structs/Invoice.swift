public class Invoice {

    var cOpaqueStruct: LDKInvoice?;

	

    public init(pointer: LDKInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: Invoice) -> Invoice {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvoice>) in
Invoice(pointer: Invoice_clone(origPointer))
};
    }

    public func into_signed_raw(this_arg: Invoice) -> SignedRawInvoice {
    	
        return SignedRawInvoice(pointer: Invoice_into_signed_raw(this_arg.cOpaqueStruct!));
    }

    public func check_signature(this_arg: Invoice) -> Result_NoneSemanticErrorZ {
    	
        return Result_NoneSemanticErrorZ(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_check_signature(this_argPointer)
});
    }

    public func from_signed(signed_invoice: SignedRawInvoice) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: Invoice_from_signed(signed_invoice.cOpaqueStruct!));
    }

    public func timestamp(this_arg: Invoice) -> UInt64 {
    	
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_timestamp(this_argPointer)
};
    }

    public func payment_hash(this_arg: Invoice) -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payment_hash(this_argPointer)
}.pointee;
    }

    public func payee_pub_key(this_arg: Invoice) -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payee_pub_key(this_argPointer)
});
    }

    public func payment_secret(this_arg: Invoice) -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_payment_secret(this_argPointer)
});
    }

    public func features(this_arg: Invoice) -> InvoiceFeatures {
    	
        return InvoiceFeatures(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_features(this_argPointer)
});
    }

    public func recover_payee_pub_key(this_arg: Invoice) -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_recover_payee_pub_key(this_argPointer)
});
    }

    public func expiry_time(this_arg: Invoice) -> UInt64 {
    	
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_expiry_time(this_argPointer)
};
    }

    public func min_final_cltv_expiry(this_arg: Invoice) -> UInt64 {
    	
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_min_final_cltv_expiry(this_argPointer)
};
    }

    public func routes(this_arg: Invoice) -> [LDKRouteHint] {
    	
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_routes(this_argPointer)
});
    }

    public func currency(this_arg: Invoice) -> LDKCurrency {
    	
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_currency(this_argPointer)
};
    }

    public func amount_pico_btc(this_arg: Invoice) -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInvoice>) in
Invoice_amount_pico_btc(this_argPointer)
});
    }

    public func from_str(s: String) -> Result_InvoiceNoneZ {
    	
        return Result_InvoiceNoneZ(pointer: Invoice_from_str(Bindings.new_LDKStr(string: s)));
    }

    public func to_str(o: Invoice) -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: o.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKInvoice>) in
Invoice_to_str(oPointer)
});
    }

				
	deinit {
					
					
		Invoice_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

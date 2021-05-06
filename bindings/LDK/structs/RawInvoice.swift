public class RawInvoice {

    var cOpaqueStruct: LDKRawInvoice?;

	

    public init(pointer: LDKRawInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_data() -> RawDataPart {
    	/* NATIVE_CALL_PREP */
        return RawDataPart(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_get_data(this_ptrPointer)
});
    }

    public func set_data(val: RawDataPart) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRawInvoice>) in
RawInvoice_set_data(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: RawInvoice) -> RawInvoice {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice(pointer: RawInvoice_clone(origPointer))
};
    }

    public func hash(this_arg: RawInvoice) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_hash(this_argPointer)
});
    }

    public func payment_hash(this_arg: RawInvoice) -> Sha256 {
    	/* NATIVE_CALL_PREP */
        return Sha256(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_hash(this_argPointer)
});
    }

    public func description(this_arg: RawInvoice) -> Description {
    	/* NATIVE_CALL_PREP */
        return Description(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description(this_argPointer)
});
    }

    public func payee_pub_key(this_arg: RawInvoice) -> PayeePubKey {
    	/* NATIVE_CALL_PREP */
        return PayeePubKey(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payee_pub_key(this_argPointer)
});
    }

    public func description_hash(this_arg: RawInvoice) -> Sha256 {
    	/* NATIVE_CALL_PREP */
        return Sha256(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description_hash(this_argPointer)
});
    }

    public func expiry_time(this_arg: RawInvoice) -> ExpiryTime {
    	/* NATIVE_CALL_PREP */
        return ExpiryTime(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_expiry_time(this_argPointer)
});
    }

    public func min_final_cltv_expiry(this_arg: RawInvoice) -> MinFinalCltvExpiry {
    	/* NATIVE_CALL_PREP */
        return MinFinalCltvExpiry(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_min_final_cltv_expiry(this_argPointer)
});
    }

    public func payment_secret(this_arg: RawInvoice) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_secret(this_argPointer)
});
    }

    public func features(this_arg: RawInvoice) -> InvoiceFeatures {
    	/* NATIVE_CALL_PREP */
        return InvoiceFeatures(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_features(this_argPointer)
});
    }

    public func routes(this_arg: RawInvoice) -> [LDKRouteHint] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_routes(this_argPointer)
});
    }

    public func amount_pico_btc(this_arg: RawInvoice) -> Option_u64Z {
    	/* NATIVE_CALL_PREP */
        return Option_u64Z(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_amount_pico_btc(this_argPointer)
});
    }

    public func currency(this_arg: RawInvoice) -> LDKCurrency {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_currency(this_argPointer)
};
    }

				
	deinit {
					
					
		RawInvoice_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

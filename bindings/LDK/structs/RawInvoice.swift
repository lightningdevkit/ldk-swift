public class RawInvoice {

    public internal(set) var cOpaqueStruct: LDKRawInvoice?;

	

    public init(pointer: LDKRawInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_data() -> RawDataPart {
    	
        return RawDataPart(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_get_data(this_ptrPointer)
});
    }

    public func set_data(val: RawDataPart) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRawInvoice>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RawInvoice_set_data(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: RawInvoice) -> RawInvoice {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice(pointer: RawInvoice_clone(origPointer))
};
    }

    public func hash() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_hash(this_argPointer)
});
    }

    public func payment_hash() -> Sha256 {
    	
        return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_hash(this_argPointer)
});
    }

    public func description() -> Description {
    	
        return Description(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description(this_argPointer)
});
    }

    public func payee_pub_key() -> PayeePubKey {
    	
        return PayeePubKey(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payee_pub_key(this_argPointer)
});
    }

    public func description_hash() -> Sha256 {
    	
        return Sha256(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_description_hash(this_argPointer)
});
    }

    public func expiry_time() -> ExpiryTime {
    	
        return ExpiryTime(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_expiry_time(this_argPointer)
});
    }

    public func min_final_cltv_expiry() -> MinFinalCltvExpiry {
    	
        return MinFinalCltvExpiry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_min_final_cltv_expiry(this_argPointer)
});
    }

    public func payment_secret() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_payment_secret(this_argPointer)
});
    }

    public func features() -> InvoiceFeatures {
    	
        return InvoiceFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_features(this_argPointer)
});
    }

    public func routes() -> [LDKRouteHint] {
    	
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_routes(this_argPointer)
});
    }

    public func amount_pico_btc() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_amount_pico_btc(this_argPointer)
});
    }

    public func currency() -> LDKCurrency {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRawInvoice>) in
RawInvoice_currency(this_argPointer)
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		RawInvoice_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

class RawInvoice {

    var cOpaqueStruct: LDKRawInvoice?;

	

    init(pointer: LDKRawInvoice){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_data() -> RawDataPart {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return RawDataPart(pointer: RawInvoice_get_data(this_ptrPointer));
    }

    func set_data(val: RawDataPart) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return RawInvoice_set_data(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: RawInvoice) -> RawInvoice {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return RawInvoice(pointer: RawInvoice_clone(origPointer));
    }

    func hash(this_arg: RawInvoice) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: RawInvoice_hash(this_argPointer));
    }

    func payment_hash(this_arg: RawInvoice) -> Sha256 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Sha256(pointer: RawInvoice_payment_hash(this_argPointer));
    }

    func description(this_arg: RawInvoice) -> Description {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Description(pointer: RawInvoice_description(this_argPointer));
    }

    func payee_pub_key(this_arg: RawInvoice) -> PayeePubKey {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return PayeePubKey(pointer: RawInvoice_payee_pub_key(this_argPointer));
    }

    func description_hash(this_arg: RawInvoice) -> Sha256 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Sha256(pointer: RawInvoice_description_hash(this_argPointer));
    }

    func expiry_time(this_arg: RawInvoice) -> ExpiryTime {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return ExpiryTime(pointer: RawInvoice_expiry_time(this_argPointer));
    }

    func min_final_cltv_expiry(this_arg: RawInvoice) -> MinFinalCltvExpiry {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return MinFinalCltvExpiry(pointer: RawInvoice_min_final_cltv_expiry(this_argPointer));
    }

    func payment_secret(this_arg: RawInvoice) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: RawInvoice_payment_secret(this_argPointer));
    }

    func features(this_arg: RawInvoice) -> InvoiceFeatures {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return InvoiceFeatures(pointer: RawInvoice_features(this_argPointer));
    }

    func routes(this_arg: RawInvoice) -> [LDKRouteHint] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_RouteHintZ_to_array(nativeType: RawInvoice_routes(this_argPointer));
    }

    func amount_pico_btc(this_arg: RawInvoice) -> Option_u64Z {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return Option_u64Z(pointer: RawInvoice_amount_pico_btc(this_argPointer));
    }

    func currency(this_arg: RawInvoice) -> LDKCurrency {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawInvoice>) in
							
			pointer
						
		}
					
        return RawInvoice_currency(this_argPointer);
    }

				
	deinit {
					
					
		RawInvoice_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

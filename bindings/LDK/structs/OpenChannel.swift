class OpenChannel {

    var cOpaqueStruct: LDKOpenChannel?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKOpenChannel){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_chain_hash(this_ptrPointer, val);
    }

    func get_temporary_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_temporary_channel_id(this_ptrPointer);
    }

    func set_temporary_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_temporary_channel_id(this_ptrPointer, val);
    }

    func get_funding_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_funding_satoshis(this_ptrPointer);
    }

    func set_funding_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_funding_satoshis(this_ptrPointer, val);
    }

    func get_push_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_push_msat(this_ptrPointer);
    }

    func set_push_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_push_msat(this_ptrPointer, val);
    }

    func get_dust_limit_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_dust_limit_satoshis(this_ptrPointer);
    }

    func set_dust_limit_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_dust_limit_satoshis(this_ptrPointer, val);
    }

    func get_max_htlc_value_in_flight_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_max_htlc_value_in_flight_msat(this_ptrPointer);
    }

    func set_max_htlc_value_in_flight_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    func get_channel_reserve_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_channel_reserve_satoshis(this_ptrPointer);
    }

    func set_channel_reserve_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_channel_reserve_satoshis(this_ptrPointer, val);
    }

    func get_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_htlc_minimum_msat(this_ptrPointer);
    }

    func set_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_feerate_per_kw() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_feerate_per_kw(this_ptrPointer);
    }

    func set_feerate_per_kw(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_feerate_per_kw(this_ptrPointer, val);
    }

    func get_to_self_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_to_self_delay(this_ptrPointer);
    }

    func set_to_self_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_to_self_delay(this_ptrPointer, val);
    }

    func get_max_accepted_htlcs() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_max_accepted_htlcs(this_ptrPointer);
    }

    func set_max_accepted_htlcs(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_max_accepted_htlcs(this_ptrPointer, val);
    }

    func get_funding_pubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_funding_pubkey(this_ptrPointer);
    }

    func set_funding_pubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_funding_pubkey(this_ptrPointer, val);
    }

    func get_revocation_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_revocation_basepoint(this_ptrPointer);
    }

    func set_revocation_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_revocation_basepoint(this_ptrPointer, val);
    }

    func get_payment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_payment_point(this_ptrPointer);
    }

    func set_payment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_payment_point(this_ptrPointer, val);
    }

    func get_delayed_payment_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_delayed_payment_basepoint(this_ptrPointer);
    }

    func set_delayed_payment_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_delayed_payment_basepoint(this_ptrPointer, val);
    }

    func get_htlc_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_htlc_basepoint(this_ptrPointer);
    }

    func set_htlc_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_htlc_basepoint(this_ptrPointer, val);
    }

    func get_first_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_first_per_commitment_point(this_ptrPointer);
    }

    func set_first_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_first_per_commitment_point(this_ptrPointer, val);
    }

    func get_channel_flags() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_channel_flags(this_ptrPointer);
    }

    func set_channel_flags(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_channel_flags(this_ptrPointer, val);
    }

    func clone(orig: OpenChannel) -> OpenChannel {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel(pointer: OpenChannel_clone(origPointer));
    }

    func write(obj: OpenChannel) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_write(objPointer);
    }

    func read(ser: [U]) -> Result_OpenChannelDecodeErrorZ {
    	
        return OpenChannel_read(ser);
    }

				
	deinit {
					
					
		OpenChannel_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

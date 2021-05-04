class OpenChannel {

    var cOpaqueStruct: LDKOpenChannel?;

	

    init(pointer: LDKOpenChannel){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_chain_hash(this_ptrPointer).pointee;
    }

    func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_temporary_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_temporary_channel_id(this_ptrPointer).pointee;
    }

    func set_temporary_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_temporary_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_funding_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_funding_satoshis(this_ptrPointer);
    }

    func set_funding_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_funding_satoshis(this_ptrPointer, val);
    }

    func get_push_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_push_msat(this_ptrPointer);
    }

    func set_push_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_push_msat(this_ptrPointer, val);
    }

    func get_dust_limit_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_dust_limit_satoshis(this_ptrPointer);
    }

    func set_dust_limit_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_dust_limit_satoshis(this_ptrPointer, val);
    }

    func get_max_htlc_value_in_flight_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_max_htlc_value_in_flight_msat(this_ptrPointer);
    }

    func set_max_htlc_value_in_flight_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    func get_channel_reserve_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_channel_reserve_satoshis(this_ptrPointer);
    }

    func set_channel_reserve_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_channel_reserve_satoshis(this_ptrPointer, val);
    }

    func get_htlc_minimum_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_htlc_minimum_msat(this_ptrPointer);
    }

    func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_feerate_per_kw() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_feerate_per_kw(this_ptrPointer);
    }

    func set_feerate_per_kw(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_feerate_per_kw(this_ptrPointer, val);
    }

    func get_to_self_delay() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_to_self_delay(this_ptrPointer);
    }

    func set_to_self_delay(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_to_self_delay(this_ptrPointer, val);
    }

    func get_max_accepted_htlcs() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_max_accepted_htlcs(this_ptrPointer);
    }

    func set_max_accepted_htlcs(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_max_accepted_htlcs(this_ptrPointer, val);
    }

    func get_funding_pubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_funding_pubkey(this_ptrPointer));
    }

    func set_funding_pubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_funding_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_revocation_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_revocation_basepoint(this_ptrPointer));
    }

    func set_revocation_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_revocation_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_payment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_payment_point(this_ptrPointer));
    }

    func set_payment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_payment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_delayed_payment_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_delayed_payment_basepoint(this_ptrPointer));
    }

    func set_delayed_payment_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_delayed_payment_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_htlc_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_htlc_basepoint(this_ptrPointer));
    }

    func set_htlc_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_htlc_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_first_per_commitment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: OpenChannel_get_first_per_commitment_point(this_ptrPointer));
    }

    func set_first_per_commitment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_set_first_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_channel_flags() -> UInt8 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return OpenChannel_get_channel_flags(this_ptrPointer);
    }

    func set_channel_flags(val: UInt8) -> Void {
    	
						
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

    func write(obj: OpenChannel) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOpenChannel>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: OpenChannel_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_OpenChannelDecodeErrorZ {
    	
        return Result_OpenChannelDecodeErrorZ(pointer: OpenChannel_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		OpenChannel_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

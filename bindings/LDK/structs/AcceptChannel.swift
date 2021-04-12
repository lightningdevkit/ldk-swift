class AcceptChannel {

    var cOpaqueStruct: LDKAcceptChannel?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKAcceptChannel){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_temporary_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_temporary_channel_id(this_ptrPointer);
    }

    func set_temporary_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_temporary_channel_id(this_ptrPointer, val);
    }

    func get_dust_limit_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_dust_limit_satoshis(this_ptrPointer);
    }

    func set_dust_limit_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_dust_limit_satoshis(this_ptrPointer, val);
    }

    func get_max_htlc_value_in_flight_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_max_htlc_value_in_flight_msat(this_ptrPointer);
    }

    func set_max_htlc_value_in_flight_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    func get_channel_reserve_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_channel_reserve_satoshis(this_ptrPointer);
    }

    func set_channel_reserve_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_channel_reserve_satoshis(this_ptrPointer, val);
    }

    func get_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_htlc_minimum_msat(this_ptrPointer);
    }

    func set_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_minimum_depth() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_minimum_depth(this_ptrPointer);
    }

    func set_minimum_depth(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_minimum_depth(this_ptrPointer, val);
    }

    func get_to_self_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_to_self_delay(this_ptrPointer);
    }

    func set_to_self_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_to_self_delay(this_ptrPointer, val);
    }

    func get_max_accepted_htlcs() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_max_accepted_htlcs(this_ptrPointer);
    }

    func set_max_accepted_htlcs(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_max_accepted_htlcs(this_ptrPointer, val);
    }

    func get_funding_pubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_funding_pubkey(this_ptrPointer);
    }

    func set_funding_pubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_funding_pubkey(this_ptrPointer, val);
    }

    func get_revocation_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_revocation_basepoint(this_ptrPointer);
    }

    func set_revocation_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_revocation_basepoint(this_ptrPointer, val);
    }

    func get_payment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_payment_point(this_ptrPointer);
    }

    func set_payment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_payment_point(this_ptrPointer, val);
    }

    func get_delayed_payment_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_delayed_payment_basepoint(this_ptrPointer);
    }

    func set_delayed_payment_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_delayed_payment_basepoint(this_ptrPointer, val);
    }

    func get_htlc_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_htlc_basepoint(this_ptrPointer);
    }

    func set_htlc_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_htlc_basepoint(this_ptrPointer, val);
    }

    func get_first_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_get_first_per_commitment_point(this_ptrPointer);
    }

    func set_first_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_set_first_per_commitment_point(this_ptrPointer, val);
    }

    func clone(orig: AcceptChannel) -> AcceptChannel {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel(pointer: AcceptChannel_clone(origPointer));
    }

    func write(obj: AcceptChannel) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAcceptChannel>) in
							
			pointer
						
		}
					
        return AcceptChannel_write(objPointer);
    }

    func read(ser: [U]) -> Result_AcceptChannelDecodeErrorZ {
    	
        return AcceptChannel_read(ser);
    }

				
	deinit {
					
					
		AcceptChannel_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

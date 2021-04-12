class ChannelHandshakeLimits {

    var cOpaqueStruct: LDKChannelHandshakeLimits?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelHandshakeLimits_default()
    }

    private init(pointer: LDKChannelHandshakeLimits){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_min_funding_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_min_funding_satoshis(this_ptrPointer);
    }

    func set_min_funding_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_min_funding_satoshis(this_ptrPointer, val);
    }

    func get_max_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_max_htlc_minimum_msat(this_ptrPointer);
    }

    func set_max_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_max_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_min_max_htlc_value_in_flight_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_min_max_htlc_value_in_flight_msat(this_ptrPointer);
    }

    func set_min_max_htlc_value_in_flight_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_min_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    func get_max_channel_reserve_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_max_channel_reserve_satoshis(this_ptrPointer);
    }

    func set_max_channel_reserve_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_max_channel_reserve_satoshis(this_ptrPointer, val);
    }

    func get_min_max_accepted_htlcs() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_min_max_accepted_htlcs(this_ptrPointer);
    }

    func set_min_max_accepted_htlcs(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_min_max_accepted_htlcs(this_ptrPointer, val);
    }

    func get_min_dust_limit_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_min_dust_limit_satoshis(this_ptrPointer);
    }

    func set_min_dust_limit_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_min_dust_limit_satoshis(this_ptrPointer, val);
    }

    func get_max_dust_limit_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_max_dust_limit_satoshis(this_ptrPointer);
    }

    func set_max_dust_limit_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_max_dust_limit_satoshis(this_ptrPointer, val);
    }

    func get_max_minimum_depth() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_max_minimum_depth(this_ptrPointer);
    }

    func set_max_minimum_depth(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_max_minimum_depth(this_ptrPointer, val);
    }

    func get_force_announced_channel_preference() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_force_announced_channel_preference(this_ptrPointer);
    }

    func set_force_announced_channel_preference(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_force_announced_channel_preference(this_ptrPointer, val);
    }

    func get_their_to_self_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_get_their_to_self_delay(this_ptrPointer);
    }

    func set_their_to_self_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits_set_their_to_self_delay(this_ptrPointer, val);
    }

    func clone(orig: ChannelHandshakeLimits) -> ChannelHandshakeLimits {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeLimits>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits(pointer: ChannelHandshakeLimits_clone(origPointer));
    }

				
	deinit {
					
					
		ChannelHandshakeLimits_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

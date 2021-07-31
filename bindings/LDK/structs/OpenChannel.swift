public class OpenChannel {

    public internal(set) var cOpaqueStruct: LDKOpenChannel?;

	

    public init(pointer: LDKOpenChannel){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_temporary_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_temporary_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_temporary_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_temporary_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_funding_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_funding_satoshis(this_ptrPointer)
};
    }

    public func set_funding_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_funding_satoshis(this_ptrPointer, val);
    }

    public func get_push_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_push_msat(this_ptrPointer)
};
    }

    public func set_push_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_push_msat(this_ptrPointer, val);
    }

    public func get_dust_limit_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_dust_limit_satoshis(this_ptrPointer)
};
    }

    public func set_dust_limit_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_dust_limit_satoshis(this_ptrPointer, val);
    }

    public func get_max_htlc_value_in_flight_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_max_htlc_value_in_flight_msat(this_ptrPointer)
};
    }

    public func set_max_htlc_value_in_flight_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    public func get_channel_reserve_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_channel_reserve_satoshis(this_ptrPointer)
};
    }

    public func set_channel_reserve_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_channel_reserve_satoshis(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_feerate_per_kw() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_feerate_per_kw(this_ptrPointer)
};
    }

    public func set_feerate_per_kw(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_feerate_per_kw(this_ptrPointer, val);
    }

    public func get_to_self_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_to_self_delay(this_ptrPointer)
};
    }

    public func set_to_self_delay(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_to_self_delay(this_ptrPointer, val);
    }

    public func get_max_accepted_htlcs() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_max_accepted_htlcs(this_ptrPointer)
};
    }

    public func set_max_accepted_htlcs(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_max_accepted_htlcs(this_ptrPointer, val);
    }

    public func get_funding_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_funding_pubkey(this_ptrPointer)
});
    }

    public func set_funding_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_funding_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_revocation_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_revocation_basepoint(this_ptrPointer)
});
    }

    public func set_revocation_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_revocation_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_payment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_payment_point(this_ptrPointer)
});
    }

    public func set_payment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_payment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_delayed_payment_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_delayed_payment_basepoint(this_ptrPointer)
});
    }

    public func set_delayed_payment_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_delayed_payment_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_htlc_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_htlc_basepoint(this_ptrPointer)
});
    }

    public func set_htlc_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_htlc_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_first_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_first_per_commitment_point(this_ptrPointer)
});
    }

    public func set_first_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_first_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_channel_flags() -> UInt8 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_get_channel_flags(this_ptrPointer)
};
    }

    public func set_channel_flags(val: UInt8) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOpenChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OpenChannel_set_channel_flags(this_ptrPointer, val);
    }

    public func clone() -> OpenChannel {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel(pointer: OpenChannel_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKOpenChannel>) in
OpenChannel_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_OpenChannelDecodeErrorZ {
    	
        return Result_OpenChannelDecodeErrorZ(pointer: OpenChannel_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		OpenChannel_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

import LDKHeaders

public class AcceptChannel {

    public internal(set) var cOpaqueStruct: LDKAcceptChannel?;

	

    public init(pointer: LDKAcceptChannel){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_temporary_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_temporary_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_temporary_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_temporary_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_dust_limit_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_dust_limit_satoshis(this_ptrPointer)
};
    }

    public func set_dust_limit_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_dust_limit_satoshis(this_ptrPointer, val);
    }

    public func get_max_htlc_value_in_flight_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_max_htlc_value_in_flight_msat(this_ptrPointer)
};
    }

    public func set_max_htlc_value_in_flight_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_max_htlc_value_in_flight_msat(this_ptrPointer, val);
    }

    public func get_channel_reserve_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_channel_reserve_satoshis(this_ptrPointer)
};
    }

    public func set_channel_reserve_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_channel_reserve_satoshis(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_minimum_depth() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_minimum_depth(this_ptrPointer)
};
    }

    public func set_minimum_depth(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_minimum_depth(this_ptrPointer, val);
    }

    public func get_to_self_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_to_self_delay(this_ptrPointer)
};
    }

    public func set_to_self_delay(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_to_self_delay(this_ptrPointer, val);
    }

    public func get_max_accepted_htlcs() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_max_accepted_htlcs(this_ptrPointer)
};
    }

    public func set_max_accepted_htlcs(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_max_accepted_htlcs(this_ptrPointer, val);
    }

    public func get_funding_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_funding_pubkey(this_ptrPointer)
});
    }

    public func set_funding_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_funding_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_revocation_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_revocation_basepoint(this_ptrPointer)
});
    }

    public func set_revocation_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_revocation_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_payment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_payment_point(this_ptrPointer)
});
    }

    public func set_payment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_payment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_delayed_payment_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_delayed_payment_basepoint(this_ptrPointer)
});
    }

    public func set_delayed_payment_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_delayed_payment_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_htlc_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_htlc_basepoint(this_ptrPointer)
});
    }

    public func set_htlc_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_htlc_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_first_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_get_first_per_commitment_point(this_ptrPointer)
});
    }

    public func set_first_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAcceptChannel>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AcceptChannel_set_first_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> AcceptChannel {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel(pointer: AcceptChannel_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKAcceptChannel>) in
AcceptChannel_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_AcceptChannelDecodeErrorZ {
    	
        return Result_AcceptChannelDecodeErrorZ(pointer: AcceptChannel_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		AcceptChannel_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

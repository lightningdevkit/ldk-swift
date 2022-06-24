public class ChannelDetails: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelDetails?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], counterparty_arg: ChannelCounterparty, funding_txo_arg: OutPoint, channel_type_arg: ChannelTypeFeatures, short_channel_id_arg: Option_u64Z, outbound_scid_alias_arg: Option_u64Z, inbound_scid_alias_arg: Option_u64Z, channel_value_satoshis_arg: UInt64, unspendable_punishment_reserve_arg: Option_u64Z, user_channel_id_arg: UInt64, balance_msat_arg: UInt64, outbound_capacity_msat_arg: UInt64, next_outbound_htlc_limit_msat_arg: UInt64, inbound_capacity_msat_arg: UInt64, confirmations_required_arg: Option_u32Z, force_close_spend_delay_arg: Option_u16Z, is_outbound_arg: Bool, is_channel_ready_arg: Bool, is_usable_arg: Bool, is_public_arg: Bool, inbound_htlc_minimum_msat_arg: Option_u64Z, inbound_htlc_maximum_msat_arg: Option_u64Z) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelDetails_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), counterparty_arg.danglingClone().cOpaqueStruct!, funding_txo_arg.danglingClone().cOpaqueStruct!, channel_type_arg.danglingClone().cOpaqueStruct!, short_channel_id_arg.danglingClone().cOpaqueStruct!, outbound_scid_alias_arg.danglingClone().cOpaqueStruct!, inbound_scid_alias_arg.danglingClone().cOpaqueStruct!, channel_value_satoshis_arg, unspendable_punishment_reserve_arg.danglingClone().cOpaqueStruct!, user_channel_id_arg, balance_msat_arg, outbound_capacity_msat_arg, next_outbound_htlc_limit_msat_arg, inbound_capacity_msat_arg, confirmations_required_arg.danglingClone().cOpaqueStruct!, force_close_spend_delay_arg.danglingClone().cOpaqueStruct!, is_outbound_arg, is_channel_ready_arg, is_usable_arg, is_public_arg, inbound_htlc_minimum_msat_arg.danglingClone().cOpaqueStruct!, inbound_htlc_maximum_msat_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelDetails){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelDetails, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_counterparty() -> ChannelCounterparty {
    	
        return ChannelCounterparty(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_counterparty(this_ptrPointer)
});
    }

    public func set_counterparty(val: ChannelCounterparty) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_counterparty(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_funding_txo() -> OutPoint? {
    	
        return 
				{ () in
					let cStruct =
				withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_funding_txo(this_ptrPointer)
};
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct)
				}()
			;
    }

    public func set_funding_txo(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_funding_txo(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_channel_type() -> ChannelTypeFeatures {
    	
        return ChannelTypeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_type(this_ptrPointer)
});
    }

    public func set_channel_type(val: ChannelTypeFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_channel_type(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_short_channel_id() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_short_channel_id(this_ptrPointer)
});
    }

    public func set_short_channel_id(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_short_channel_id(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_outbound_scid_alias() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_outbound_scid_alias(this_ptrPointer)
});
    }

    public func set_outbound_scid_alias(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_outbound_scid_alias(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_inbound_scid_alias() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_scid_alias(this_ptrPointer)
});
    }

    public func set_inbound_scid_alias(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_inbound_scid_alias(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_channel_value_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_value_satoshis(this_ptrPointer)
};
    }

    public func set_channel_value_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_channel_value_satoshis(this_ptrPointer, val);
    }

    public func get_unspendable_punishment_reserve() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_unspendable_punishment_reserve(this_ptrPointer)
});
    }

    public func set_unspendable_punishment_reserve(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_unspendable_punishment_reserve(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_user_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_user_channel_id(this_ptrPointer)
};
    }

    public func set_user_channel_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_user_channel_id(this_ptrPointer, val);
    }

    public func get_balance_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_balance_msat(this_ptrPointer)
};
    }

    public func set_balance_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_balance_msat(this_ptrPointer, val);
    }

    public func get_outbound_capacity_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_outbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_outbound_capacity_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_outbound_capacity_msat(this_ptrPointer, val);
    }

    public func get_next_outbound_htlc_limit_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_next_outbound_htlc_limit_msat(this_ptrPointer)
};
    }

    public func set_next_outbound_htlc_limit_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_next_outbound_htlc_limit_msat(this_ptrPointer, val);
    }

    public func get_inbound_capacity_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_inbound_capacity_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_inbound_capacity_msat(this_ptrPointer, val);
    }

    public func get_confirmations_required() -> Option_u32Z {
    	
        return Option_u32Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_confirmations_required(this_ptrPointer)
});
    }

    public func set_confirmations_required(val: Option_u32Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_confirmations_required(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_force_close_spend_delay() -> Option_u16Z {
    	
        return Option_u16Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_force_close_spend_delay(this_ptrPointer)
});
    }

    public func set_force_close_spend_delay(val: Option_u16Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_force_close_spend_delay(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_is_outbound() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_outbound(this_ptrPointer)
};
    }

    public func set_is_outbound(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_outbound(this_ptrPointer, val);
    }

    public func get_is_channel_ready() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_channel_ready(this_ptrPointer)
};
    }

    public func set_is_channel_ready(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_channel_ready(this_ptrPointer, val);
    }

    public func get_is_usable() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_usable(this_ptrPointer)
};
    }

    public func set_is_usable(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_usable(this_ptrPointer, val);
    }

    public func get_is_public() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_public(this_ptrPointer)
};
    }

    public func set_is_public(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_is_public(this_ptrPointer, val);
    }

    public func get_inbound_htlc_minimum_msat() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_htlc_minimum_msat(this_ptrPointer)
});
    }

    public func set_inbound_htlc_minimum_msat(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_inbound_htlc_minimum_msat(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_inbound_htlc_maximum_msat() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_htlc_maximum_msat(this_ptrPointer)
});
    }

    public func set_inbound_htlc_maximum_msat(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelDetails_set_inbound_htlc_maximum_msat(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChannelDetails {
    	
        return ChannelDetails(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelDetails {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func get_inbound_payment_scid() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_payment_scid(this_argPointer)
});
    }

    public func get_outbound_payment_scid() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_outbound_payment_scid(this_argPointer)
});
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelDetailsDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelDetailsDecodeErrorZ(pointer: ChannelDetails_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelDetails_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelDetails {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelDetails \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelDetails \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

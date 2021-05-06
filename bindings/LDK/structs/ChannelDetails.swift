public class ChannelDetails {

    var cOpaqueStruct: LDKChannelDetails?;

	

    public init(pointer: LDKChannelDetails){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_short_channel_id() -> Option_u64Z {
    	/* NATIVE_CALL_PREP */
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_short_channel_id(this_ptrPointer)
});
    }

    public func set_short_channel_id(val: Option_u64Z) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_short_channel_id(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_remote_network_id() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_remote_network_id(this_ptrPointer)
});
    }

    public func set_remote_network_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_remote_network_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func get_counterparty_features() -> InitFeatures {
    	/* NATIVE_CALL_PREP */
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_counterparty_features(this_ptrPointer)
});
    }

    public func set_counterparty_features(val: InitFeatures) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_counterparty_features(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_channel_value_satoshis() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_channel_value_satoshis(this_ptrPointer)
};
    }

    public func set_channel_value_satoshis(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_channel_value_satoshis(this_ptrPointer, val)
};
    }

    public func get_user_id() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_user_id(this_ptrPointer)
};
    }

    public func set_user_id(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_user_id(this_ptrPointer, val)
};
    }

    public func get_outbound_capacity_msat() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_outbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_outbound_capacity_msat(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_outbound_capacity_msat(this_ptrPointer, val)
};
    }

    public func get_inbound_capacity_msat() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_inbound_capacity_msat(this_ptrPointer)
};
    }

    public func set_inbound_capacity_msat(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_inbound_capacity_msat(this_ptrPointer, val)
};
    }

    public func get_is_live() -> Bool {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails_get_is_live(this_ptrPointer)
};
    }

    public func set_is_live(val: Bool) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
ChannelDetails_set_is_live(this_ptrPointer, val)
};
    }

    public func clone(orig: ChannelDetails) -> ChannelDetails {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelDetails>) in
ChannelDetails(pointer: ChannelDetails_clone(origPointer))
};
    }

				
	deinit {
					
					
		ChannelDetails_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class UnsignedChannelAnnouncement {

    var cOpaqueStruct: LDKUnsignedChannelAnnouncement?;

	

    public init(pointer: LDKUnsignedChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> ChannelFeatures {
    	/* NATIVE_CALL_PREP */
        return ChannelFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_features(this_ptrPointer)
});
    }

    public func set_features(val: ChannelFeatures) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_features(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_chain_hash(this_ptrPointer)
}.pointee;
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_short_channel_id() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_short_channel_id(this_ptrPointer, val)
};
    }

    public func get_node_id_1() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_node_id_1(this_ptrPointer)
});
    }

    public func set_node_id_1(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_node_id_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func get_node_id_2() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_node_id_2(this_ptrPointer)
});
    }

    public func set_node_id_2(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_node_id_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func get_bitcoin_key_1() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_bitcoin_key_1(this_ptrPointer)
});
    }

    public func set_bitcoin_key_1(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_bitcoin_key_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func get_bitcoin_key_2() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_bitcoin_key_2(this_ptrPointer)
});
    }

    public func set_bitcoin_key_2(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_set_bitcoin_key_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func clone(orig: UnsignedChannelAnnouncement) -> UnsignedChannelAnnouncement {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement(pointer: UnsignedChannelAnnouncement_clone(origPointer))
};
    }

    public func write(obj: UnsignedChannelAnnouncement) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: UnsignedChannelAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UnsignedChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

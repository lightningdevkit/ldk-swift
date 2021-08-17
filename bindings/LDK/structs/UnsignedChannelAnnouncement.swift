import LDKHeaders

public class UnsignedChannelAnnouncement {

    public internal(set) var cOpaqueStruct: LDKUnsignedChannelAnnouncement?;

	

    public init(pointer: LDKUnsignedChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> ChannelFeatures {
    	
        return ChannelFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_features(this_ptrPointer)
});
    }

    public func set_features(val: ChannelFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_features(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_short_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_node_id_1() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_node_id_1(this_ptrPointer)
});
    }

    public func set_node_id_1(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_node_id_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_node_id_2() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_node_id_2(this_ptrPointer)
});
    }

    public func set_node_id_2(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_node_id_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_bitcoin_key_1() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_bitcoin_key_1(this_ptrPointer)
});
    }

    public func set_bitcoin_key_1(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_bitcoin_key_1(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_bitcoin_key_2() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_get_bitcoin_key_2(this_ptrPointer)
});
    }

    public func set_bitcoin_key_2(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelAnnouncement_set_bitcoin_key_2(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> UnsignedChannelAnnouncement {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement(pointer: UnsignedChannelAnnouncement_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
UnsignedChannelAnnouncement_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: UnsignedChannelAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		UnsignedChannelAnnouncement_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

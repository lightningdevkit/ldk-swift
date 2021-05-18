public class UnsignedChannelUpdate {

    var cOpaqueStruct: LDKUnsignedChannelUpdate?;

	

    public init(pointer: LDKUnsignedChannelUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_short_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_timestamp() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_timestamp(this_ptrPointer)
};
    }

    public func set_timestamp(val: UInt32) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_timestamp(this_ptrPointer, val);
    }

    public func get_flags() -> UInt8 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_flags(this_ptrPointer)
};
    }

    public func set_flags(val: UInt8) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_flags(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_fee_base_msat() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_fee_base_msat(this_ptrPointer)
};
    }

    public func set_fee_base_msat(val: UInt32) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_fee_base_msat(this_ptrPointer, val);
    }

    public func get_fee_proportional_millionths() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_fee_proportional_millionths(this_ptrPointer)
};
    }

    public func set_fee_proportional_millionths(val: UInt32) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedChannelUpdate_set_fee_proportional_millionths(this_ptrPointer, val);
    }

    public func clone(orig: UnsignedChannelUpdate) -> UnsignedChannelUpdate {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate(pointer: UnsignedChannelUpdate_clone(origPointer))
};
    }

    public func write(obj: UnsignedChannelUpdate) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_UnsignedChannelUpdateDecodeErrorZ {
    	
        return Result_UnsignedChannelUpdateDecodeErrorZ(pointer: UnsignedChannelUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		UnsignedChannelUpdate_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

public class ChannelConfig {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKChannelConfig?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelConfig_default()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelConfig){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_forwarding_fee_proportional_millionths() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_get_forwarding_fee_proportional_millionths(this_ptrPointer)
};
    }

    public func set_forwarding_fee_proportional_millionths(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelConfig_set_forwarding_fee_proportional_millionths(this_ptrPointer, val);
    }

    public func get_forwarding_fee_base_msat() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_get_forwarding_fee_base_msat(this_ptrPointer)
};
    }

    public func set_forwarding_fee_base_msat(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelConfig_set_forwarding_fee_base_msat(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelConfig_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func get_announced_channel() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_get_announced_channel(this_ptrPointer)
};
    }

    public func set_announced_channel(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelConfig_set_announced_channel(this_ptrPointer, val);
    }

    public func get_commit_upfront_shutdown_pubkey() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_get_commit_upfront_shutdown_pubkey(this_ptrPointer)
};
    }

    public func set_commit_upfront_shutdown_pubkey(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelConfig_set_commit_upfront_shutdown_pubkey(this_ptrPointer, val);
    }

    public func clone() -> ChannelConfig {
    	
        return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelConfig {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelConfig>) in
ChannelConfig_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelConfigDecodeErrorZ {
    	
        return Result_ChannelConfigDecodeErrorZ(pointer: ChannelConfig_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return ChannelConfig_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelConfig {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

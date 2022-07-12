#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ChannelHandshakeConfig: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelHandshakeConfig?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelHandshakeConfig_default()
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelHandshakeConfig){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelHandshakeConfig, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_minimum_depth() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_minimum_depth(this_ptrPointer)
};
    }

    public func set_minimum_depth(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_minimum_depth(this_ptrPointer, val);
    }

    public func get_our_to_self_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_our_to_self_delay(this_ptrPointer)
};
    }

    public func set_our_to_self_delay(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_our_to_self_delay(this_ptrPointer, val);
    }

    public func get_our_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_our_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_our_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_our_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_max_inbound_htlc_value_in_flight_percent_of_channel() -> UInt8 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_max_inbound_htlc_value_in_flight_percent_of_channel(this_ptrPointer)
};
    }

    public func set_max_inbound_htlc_value_in_flight_percent_of_channel(val: UInt8) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_max_inbound_htlc_value_in_flight_percent_of_channel(this_ptrPointer, val);
    }

    public func get_negotiate_scid_privacy() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_negotiate_scid_privacy(this_ptrPointer)
};
    }

    public func set_negotiate_scid_privacy(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_negotiate_scid_privacy(this_ptrPointer, val);
    }

    public func get_announced_channel() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_announced_channel(this_ptrPointer)
};
    }

    public func set_announced_channel(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_announced_channel(this_ptrPointer, val);
    }

    public func get_commit_upfront_shutdown_pubkey() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_get_commit_upfront_shutdown_pubkey(this_ptrPointer)
};
    }

    public func set_commit_upfront_shutdown_pubkey(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelHandshakeConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelHandshakeConfig_set_commit_upfront_shutdown_pubkey(this_ptrPointer, val);
    }

    public func clone() -> ChannelHandshakeConfig {
    	
        return ChannelHandshakeConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelHandshakeConfig {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return ChannelHandshakeConfig_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelHandshakeConfig {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelHandshakeConfig \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelHandshakeConfig \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

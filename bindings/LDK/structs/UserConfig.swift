import LDKHeaders

public class UserConfig: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKUserConfig?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = UserConfig_default()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUserConfig){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_own_channel_config() -> ChannelHandshakeConfig {
    	
        return ChannelHandshakeConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_own_channel_config(this_ptrPointer)
});
    }

    public func set_own_channel_config(val: ChannelHandshakeConfig) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UserConfig_set_own_channel_config(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_peer_channel_config_limits() -> ChannelHandshakeLimits {
    	
        return ChannelHandshakeLimits(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_peer_channel_config_limits(this_ptrPointer)
});
    }

    public func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UserConfig_set_peer_channel_config_limits(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_channel_options() -> ChannelConfig {
    	
        return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_options(this_ptrPointer)
});
    }

    public func set_channel_options(val: ChannelConfig) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UserConfig_set_channel_options(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_accept_forwards_to_priv_channels() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_accept_forwards_to_priv_channels(this_ptrPointer)
};
    }

    public func set_accept_forwards_to_priv_channels(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UserConfig_set_accept_forwards_to_priv_channels(this_ptrPointer, val);
    }

    public func clone() -> UserConfig {
    	
        return UserConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_clone(origPointer)
});
    }

					internal func danglingClone() -> UserConfig {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return UserConfig_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UserConfig {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing UserConfig \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing UserConfig \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

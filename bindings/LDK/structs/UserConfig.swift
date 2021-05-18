public class UserConfig {

    var cOpaqueStruct: LDKUserConfig?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = UserConfig_default()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUserConfig){
		self.cOpaqueStruct = pointer
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
					
        return UserConfig_set_own_channel_config(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_peer_channel_config_limits() -> ChannelHandshakeLimits {
    	
        return ChannelHandshakeLimits(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_peer_channel_config_limits(this_ptrPointer)
});
    }

    public func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UserConfig_set_peer_channel_config_limits(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_channel_options() -> ChannelConfig {
    	
        return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_options(this_ptrPointer)
});
    }

    public func set_channel_options(val: ChannelConfig) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUserConfig>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UserConfig_set_channel_options(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: UserConfig) -> UserConfig {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in
UserConfig(pointer: UserConfig_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		UserConfig_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

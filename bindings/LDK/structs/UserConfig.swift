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
    	/* NATIVE_CALL_PREP */
        return ChannelHandshakeConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_own_channel_config(this_ptrPointer)
});
    }

    public func set_own_channel_config(val: ChannelHandshakeConfig) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUserConfig>) in
UserConfig_set_own_channel_config(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_peer_channel_config_limits() -> ChannelHandshakeLimits {
    	/* NATIVE_CALL_PREP */
        return ChannelHandshakeLimits(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_peer_channel_config_limits(this_ptrPointer)
});
    }

    public func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUserConfig>) in
UserConfig_set_peer_channel_config_limits(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_channel_options() -> ChannelConfig {
    	/* NATIVE_CALL_PREP */
        return ChannelConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUserConfig>) in
UserConfig_get_channel_options(this_ptrPointer)
});
    }

    public func set_channel_options(val: ChannelConfig) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUserConfig>) in
UserConfig_set_channel_options(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: UserConfig) -> UserConfig {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUserConfig>) in
UserConfig(pointer: UserConfig_clone(origPointer))
};
    }

				
	deinit {
					
					
		UserConfig_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

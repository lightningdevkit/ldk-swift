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
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig(pointer: UserConfig_get_own_channel_config(this_ptrPointer));
    }

    public func set_own_channel_config(val: ChannelHandshakeConfig) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_own_channel_config(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_peer_channel_config_limits() -> ChannelHandshakeLimits {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeLimits(pointer: UserConfig_get_peer_channel_config_limits(this_ptrPointer));
    }

    public func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_peer_channel_config_limits(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_channel_options() -> ChannelConfig {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig(pointer: UserConfig_get_channel_options(this_ptrPointer));
    }

    public func set_channel_options(val: ChannelConfig) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_channel_options(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: UserConfig) -> UserConfig {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig(pointer: UserConfig_clone(origPointer));
    }

				
	deinit {
					
					
		UserConfig_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

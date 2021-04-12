class UserConfig {

    var cOpaqueStruct: LDKUserConfig?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = UserConfig_default()
    }

    private init(pointer: LDKUserConfig){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_own_channel_config() -> ChannelHandshakeConfig {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_get_own_channel_config(this_ptrPointer);
    }

    func set_own_channel_config(val: ChannelHandshakeConfig) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_own_channel_config(this_ptrPointer, val);
    }

    func get_peer_channel_config_limits() -> ChannelHandshakeLimits {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_get_peer_channel_config_limits(this_ptrPointer);
    }

    func set_peer_channel_config_limits(val: ChannelHandshakeLimits) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_peer_channel_config_limits(this_ptrPointer, val);
    }

    func get_channel_options() -> ChannelConfig {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_get_channel_options(this_ptrPointer);
    }

    func set_channel_options(val: ChannelConfig) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUserConfig>) in
							
			pointer
						
		}
					
        return UserConfig_set_channel_options(this_ptrPointer, val);
    }

    func clone(orig: UserConfig) -> UserConfig {
    	
						
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

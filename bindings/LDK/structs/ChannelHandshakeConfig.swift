class ChannelHandshakeConfig {

    var cOpaqueStruct: LDKChannelHandshakeConfig?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelHandshakeConfig_default()
    }

    private init(pointer: LDKChannelHandshakeConfig){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_minimum_depth() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_minimum_depth(this_ptrPointer);
    }

    func set_minimum_depth(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_minimum_depth(this_ptrPointer, val);
    }

    func get_our_to_self_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_our_to_self_delay(this_ptrPointer);
    }

    func set_our_to_self_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_our_to_self_delay(this_ptrPointer, val);
    }

    func get_our_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_our_htlc_minimum_msat(this_ptrPointer);
    }

    func set_our_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_our_htlc_minimum_msat(this_ptrPointer, val);
    }

    func clone(orig: ChannelHandshakeConfig) -> ChannelHandshakeConfig {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig(pointer: ChannelHandshakeConfig_clone(origPointer));
    }

				
	deinit {
					
					
		ChannelHandshakeConfig_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

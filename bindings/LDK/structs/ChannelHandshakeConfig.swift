public class ChannelHandshakeConfig {

    var cOpaqueStruct: LDKChannelHandshakeConfig?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = ChannelHandshakeConfig_default()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelHandshakeConfig){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_minimum_depth() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_minimum_depth(this_ptrPointer);
    }

    public func set_minimum_depth(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_minimum_depth(this_ptrPointer, val);
    }

    public func get_our_to_self_delay() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_our_to_self_delay(this_ptrPointer);
    }

    public func set_our_to_self_delay(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_our_to_self_delay(this_ptrPointer, val);
    }

    public func get_our_htlc_minimum_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_get_our_htlc_minimum_msat(this_ptrPointer);
    }

    public func set_our_htlc_minimum_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelHandshakeConfig>) in
							
			pointer
						
		}
					
        return ChannelHandshakeConfig_set_our_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func clone(orig: ChannelHandshakeConfig) -> ChannelHandshakeConfig {
    	
						
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

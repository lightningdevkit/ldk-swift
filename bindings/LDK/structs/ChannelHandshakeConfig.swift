public class ChannelHandshakeConfig {

    public internal(set) var cOpaqueStruct: LDKChannelHandshakeConfig?;

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

    public func clone() -> ChannelHandshakeConfig {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelHandshakeConfig>) in
ChannelHandshakeConfig(pointer: ChannelHandshakeConfig_clone(origPointer))
};
    }

				
	deinit {
					
					
					
		ChannelHandshakeConfig_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

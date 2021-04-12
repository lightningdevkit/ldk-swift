class ChannelConfig {

    var cOpaqueStruct: LDKChannelConfig?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelConfig_default()
    }

    private init(pointer: LDKChannelConfig){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_fee_proportional_millionths() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_fee_proportional_millionths(this_ptrPointer);
    }

    func set_fee_proportional_millionths(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_fee_proportional_millionths(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func get_announced_channel() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_announced_channel(this_ptrPointer);
    }

    func set_announced_channel(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_announced_channel(this_ptrPointer, val);
    }

    func get_commit_upfront_shutdown_pubkey() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_commit_upfront_shutdown_pubkey(this_ptrPointer);
    }

    func set_commit_upfront_shutdown_pubkey(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_commit_upfront_shutdown_pubkey(this_ptrPointer, val);
    }

    func clone(orig: ChannelConfig) -> ChannelConfig {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig(pointer: ChannelConfig_clone(origPointer));
    }

    func write(obj: ChannelConfig) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelConfigDecodeErrorZ {
    	
        return ChannelConfig_read(ser);
    }

				
	deinit {
					
					
		ChannelConfig_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

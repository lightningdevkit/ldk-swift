class ChannelConfig {

    var cOpaqueStruct: LDKChannelConfig?;

	/* DEFAULT_CONSTRUCTOR_START */
    init() {
    	
        self.cOpaqueStruct = ChannelConfig_default()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelConfig){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_fee_proportional_millionths() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_fee_proportional_millionths(this_ptrPointer);
    }

    func set_fee_proportional_millionths(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_fee_proportional_millionths(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func get_announced_channel() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_announced_channel(this_ptrPointer);
    }

    func set_announced_channel(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_set_announced_channel(this_ptrPointer, val);
    }

    func get_commit_upfront_shutdown_pubkey() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return ChannelConfig_get_commit_upfront_shutdown_pubkey(this_ptrPointer);
    }

    func set_commit_upfront_shutdown_pubkey(val: Bool) -> Void {
    	
						
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

    func write(obj: ChannelConfig) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelConfig>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelConfig_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelConfigDecodeErrorZ {
    	
        return Result_ChannelConfigDecodeErrorZ(pointer: ChannelConfig_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelConfig_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

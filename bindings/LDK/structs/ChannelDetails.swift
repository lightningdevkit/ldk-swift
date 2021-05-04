class ChannelDetails {

    var cOpaqueStruct: LDKChannelDetails?;

	

    init(pointer: LDKChannelDetails){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_short_channel_id() -> Option_u64Z {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return Option_u64Z(pointer: ChannelDetails_get_short_channel_id(this_ptrPointer));
    }

    func set_short_channel_id(val: Option_u64Z) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_short_channel_id(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_remote_network_id() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelDetails_get_remote_network_id(this_ptrPointer));
    }

    func set_remote_network_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_remote_network_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func get_counterparty_features() -> InitFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return InitFeatures(pointer: ChannelDetails_get_counterparty_features(this_ptrPointer));
    }

    func set_counterparty_features(val: InitFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_counterparty_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_channel_value_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_channel_value_satoshis(this_ptrPointer);
    }

    func set_channel_value_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_channel_value_satoshis(this_ptrPointer, val);
    }

    func get_user_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_user_id(this_ptrPointer);
    }

    func set_user_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_user_id(this_ptrPointer, val);
    }

    func get_outbound_capacity_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_outbound_capacity_msat(this_ptrPointer);
    }

    func set_outbound_capacity_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_outbound_capacity_msat(this_ptrPointer, val);
    }

    func get_inbound_capacity_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_inbound_capacity_msat(this_ptrPointer);
    }

    func set_inbound_capacity_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_inbound_capacity_msat(this_ptrPointer, val);
    }

    func get_is_live() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_is_live(this_ptrPointer);
    }

    func set_is_live(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_is_live(this_ptrPointer, val);
    }

    func clone(orig: ChannelDetails) -> ChannelDetails {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails(pointer: ChannelDetails_clone(origPointer));
    }

				
	deinit {
					
					
		ChannelDetails_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

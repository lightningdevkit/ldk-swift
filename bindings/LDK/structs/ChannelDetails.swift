class ChannelDetails {

    var cOpaqueStruct: LDKChannelDetails?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKChannelDetails){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_channel_id(this_ptrPointer, val);
    }

    func get_remote_network_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_remote_network_id(this_ptrPointer);
    }

    func set_remote_network_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_remote_network_id(this_ptrPointer, val);
    }

    func get_counterparty_features() -> InitFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_counterparty_features(this_ptrPointer);
    }

    func set_counterparty_features(val: InitFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_counterparty_features(this_ptrPointer, val);
    }

    func get_channel_value_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_channel_value_satoshis(this_ptrPointer);
    }

    func set_channel_value_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_channel_value_satoshis(this_ptrPointer, val);
    }

    func get_user_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_user_id(this_ptrPointer);
    }

    func set_user_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_user_id(this_ptrPointer, val);
    }

    func get_outbound_capacity_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_outbound_capacity_msat(this_ptrPointer);
    }

    func set_outbound_capacity_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_outbound_capacity_msat(this_ptrPointer, val);
    }

    func get_inbound_capacity_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_inbound_capacity_msat(this_ptrPointer);
    }

    func set_inbound_capacity_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_set_inbound_capacity_msat(this_ptrPointer, val);
    }

    func get_is_live() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelDetails>) in
							
			pointer
						
		}
					
        return ChannelDetails_get_is_live(this_ptrPointer);
    }

    func set_is_live(val: boolean) -> Void {
    	
						
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

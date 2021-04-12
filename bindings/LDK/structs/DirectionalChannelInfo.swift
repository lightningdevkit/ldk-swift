class DirectionalChannelInfo {

    var cOpaqueStruct: LDKDirectionalChannelInfo?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKDirectionalChannelInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_last_update() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_last_update(this_ptrPointer);
    }

    func set_last_update(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_last_update(this_ptrPointer, val);
    }

    func get_enabled() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_enabled(this_ptrPointer);
    }

    func set_enabled(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_enabled(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func get_htlc_minimum_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_htlc_minimum_msat(this_ptrPointer);
    }

    func set_htlc_minimum_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    func get_fees() -> RoutingFees {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_fees(this_ptrPointer);
    }

    func set_fees(val: RoutingFees) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_fees(this_ptrPointer, val);
    }

    func get_last_update_message() -> ChannelUpdate {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_get_last_update_message(this_ptrPointer);
    }

    func set_last_update_message(val: ChannelUpdate) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_set_last_update_message(this_ptrPointer, val);
    }

    func clone(orig: DirectionalChannelInfo) -> DirectionalChannelInfo {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo(pointer: DirectionalChannelInfo_clone(origPointer));
    }

    func write(obj: DirectionalChannelInfo) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectionalChannelInfo>) in
							
			pointer
						
		}
					
        return DirectionalChannelInfo_write(objPointer);
    }

    func read(ser: [U]) -> Result_DirectionalChannelInfoDecodeErrorZ {
    	
        return DirectionalChannelInfo_read(ser);
    }

				
	deinit {
					
					
		DirectionalChannelInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

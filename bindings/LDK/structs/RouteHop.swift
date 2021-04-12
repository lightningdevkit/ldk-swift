class RouteHop {

    var cOpaqueStruct: LDKRouteHop?;

    init(pubkey_arg: [U], node_features_arg: NodeFeatures, short_channel_id_arg: U, channel_features_arg: ChannelFeatures, fee_msat_arg: U, cltv_expiry_delta_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = RouteHop_new(pubkey_arg, node_features_arg, short_channel_id_arg, channel_features_arg, fee_msat_arg, cltv_expiry_delta_arg)
    }

    private init(pointer: LDKRouteHop){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_pubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_pubkey(this_ptrPointer);
    }

    func set_pubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_pubkey(this_ptrPointer, val);
    }

    func get_node_features() -> NodeFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_node_features(this_ptrPointer);
    }

    func set_node_features(val: NodeFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_node_features(this_ptrPointer, val);
    }

    func get_short_channel_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_short_channel_id(this_ptrPointer, val);
    }

    func get_channel_features() -> ChannelFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_channel_features(this_ptrPointer);
    }

    func set_channel_features(val: ChannelFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_channel_features(this_ptrPointer, val);
    }

    func get_fee_msat() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_fee_msat(this_ptrPointer);
    }

    func set_fee_msat(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_fee_msat(this_ptrPointer, val);
    }

    func get_cltv_expiry_delta() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_cltv_expiry_delta(this_ptrPointer);
    }

    func set_cltv_expiry_delta(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    func clone(orig: RouteHop) -> RouteHop {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop(pointer: RouteHop_clone(origPointer));
    }

				
	deinit {
					
					
		RouteHop_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

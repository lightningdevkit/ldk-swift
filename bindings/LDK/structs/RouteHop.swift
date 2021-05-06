public class RouteHop {

    var cOpaqueStruct: LDKRouteHop?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkey_arg: [UInt8], node_features_arg: NodeFeatures, short_channel_id_arg: UInt64, channel_features_arg: ChannelFeatures, fee_msat_arg: UInt64, cltv_expiry_delta_arg: UInt32) {
    	
		let converted_pubkey_arg = Bindings.new_LDKPublicKey(array: pubkey_arg)
        self.cOpaqueStruct = RouteHop_new(converted_pubkey_arg, node_features_arg.cOpaqueStruct!, short_channel_id_arg, channel_features_arg.cOpaqueStruct!, fee_msat_arg, cltv_expiry_delta_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRouteHop){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_pubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: RouteHop_get_pubkey(this_ptrPointer));
    }

    public func set_pubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_node_features() -> NodeFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return NodeFeatures(pointer: RouteHop_get_node_features(this_ptrPointer));
    }

    public func set_node_features(val: NodeFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_node_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_short_channel_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_short_channel_id(this_ptrPointer);
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_channel_features() -> ChannelFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return ChannelFeatures(pointer: RouteHop_get_channel_features(this_ptrPointer));
    }

    public func set_channel_features(val: ChannelFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_channel_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_fee_msat() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_fee_msat(this_ptrPointer);
    }

    public func set_fee_msat(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_fee_msat(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_get_cltv_expiry_delta(this_ptrPointer);
    }

    public func set_cltv_expiry_delta(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRouteHop>) in
							
			pointer
						
		}
					
        return RouteHop_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func clone(orig: RouteHop) -> RouteHop {
    	
						
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

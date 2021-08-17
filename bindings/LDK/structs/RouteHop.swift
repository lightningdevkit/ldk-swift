import LDKHeaders

public class RouteHop {

    public internal(set) var cOpaqueStruct: LDKRouteHop?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkey_arg: [UInt8], node_features_arg: NodeFeatures, short_channel_id_arg: UInt64, channel_features_arg: ChannelFeatures, fee_msat_arg: UInt64, cltv_expiry_delta_arg: UInt32) {
    	
        self.cOpaqueStruct = RouteHop_new(Bindings.new_LDKPublicKey(array: pubkey_arg), node_features_arg.clone().cOpaqueStruct!, short_channel_id_arg, channel_features_arg.clone().cOpaqueStruct!, fee_msat_arg, cltv_expiry_delta_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRouteHop){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_pubkey(this_ptrPointer)
});
    }

    public func set_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_node_features() -> NodeFeatures {
    	
        return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_node_features(this_ptrPointer)
});
    }

    public func set_node_features(val: NodeFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_node_features(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_short_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_channel_features() -> ChannelFeatures {
    	
        return ChannelFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_channel_features(this_ptrPointer)
});
    }

    public func set_channel_features(val: ChannelFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_channel_features(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_fee_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_fee_msat(this_ptrPointer)
};
    }

    public func set_fee_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_fee_msat(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRouteHop>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RouteHop_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func clone() -> RouteHop {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHop>) in
RouteHop(pointer: RouteHop_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRouteHop>) in
RouteHop_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: RouteHop_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		RouteHop_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

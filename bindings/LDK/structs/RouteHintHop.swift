public class RouteHintHop {

    var cOpaqueStruct: LDKRouteHintHop?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(src_node_id_arg: [UInt8], short_channel_id_arg: UInt64, fees_arg: RoutingFees, cltv_expiry_delta_arg: UInt16, htlc_minimum_msat_arg: Option_u64Z, htlc_maximum_msat_arg: Option_u64Z) {
    	
		let converted_src_node_id_arg = Bindings.new_LDKPublicKey(array: src_node_id_arg)
        self.cOpaqueStruct = RouteHintHop_new(converted_src_node_id_arg, short_channel_id_arg, fees_arg.cOpaqueStruct!, cltv_expiry_delta_arg, htlc_minimum_msat_arg.cOpaqueStruct!, htlc_maximum_msat_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRouteHintHop){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_src_node_id() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_src_node_id(this_ptrPointer)
});
    }

    public func set_src_node_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_src_node_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func get_short_channel_id() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_short_channel_id(this_ptrPointer, val)
};
    }

    public func get_fees() -> RoutingFees {
    	/* NATIVE_CALL_PREP */
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_fees(this_ptrPointer)
});
    }

    public func set_fees(val: RoutingFees) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_fees(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_cltv_expiry_delta(this_ptrPointer, val)
};
    }

    public func get_htlc_minimum_msat() -> Option_u64Z {
    	/* NATIVE_CALL_PREP */
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_htlc_minimum_msat(this_ptrPointer)
});
    }

    public func set_htlc_minimum_msat(val: Option_u64Z) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_htlc_minimum_msat(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_htlc_maximum_msat() -> Option_u64Z {
    	/* NATIVE_CALL_PREP */
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop_get_htlc_maximum_msat(this_ptrPointer)
});
    }

    public func set_htlc_maximum_msat(val: Option_u64Z) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRouteHintHop>) in
RouteHintHop_set_htlc_maximum_msat(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: RouteHintHop) -> RouteHintHop {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHintHop>) in
RouteHintHop(pointer: RouteHintHop_clone(origPointer))
};
    }

				
	deinit {
					
					
		RouteHintHop_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

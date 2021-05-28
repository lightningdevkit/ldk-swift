public class RoutingFees {

    public internal(set) var cOpaqueStruct: LDKRoutingFees?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(base_msat_arg: UInt32, proportional_millionths_arg: UInt32) {
    	
        self.cOpaqueStruct = RoutingFees_new(base_msat_arg, proportional_millionths_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRoutingFees){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_base_msat() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_get_base_msat(this_ptrPointer)
};
    }

    public func set_base_msat(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoutingFees>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RoutingFees_set_base_msat(this_ptrPointer, val);
    }

    public func get_proportional_millionths() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_get_proportional_millionths(this_ptrPointer)
};
    }

    public func set_proportional_millionths(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRoutingFees>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RoutingFees_set_proportional_millionths(this_ptrPointer, val);
    }

    public func clone(orig: RoutingFees) -> RoutingFees {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees(pointer: RoutingFees_clone(origPointer))
};
    }

    public func read(ser: [UInt8]) -> Result_RoutingFeesDecodeErrorZ {
    	
        return Result_RoutingFeesDecodeErrorZ(pointer: RoutingFees_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: RoutingFees) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRoutingFees>) in
RoutingFees_write(objPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		RoutingFees_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

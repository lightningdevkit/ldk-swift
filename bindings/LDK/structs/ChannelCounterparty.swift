public class ChannelCounterparty {

    public internal(set) var cOpaqueStruct: LDKChannelCounterparty?;

	

    public init(pointer: LDKChannelCounterparty){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_node_id() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_node_id(this_ptrPointer)
});
    }

    public func set_node_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_node_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_features() -> InitFeatures {
    	
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InitFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_unspendable_punishment_reserve() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_unspendable_punishment_reserve(this_ptrPointer)
};
    }

    public func set_unspendable_punishment_reserve(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_unspendable_punishment_reserve(this_ptrPointer, val);
    }

    public func clone(orig: ChannelCounterparty) -> ChannelCounterparty {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty(pointer: ChannelCounterparty_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelCounterparty_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

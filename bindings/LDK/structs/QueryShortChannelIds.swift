public class QueryShortChannelIds {

    public internal(set) var cOpaqueStruct: LDKQueryShortChannelIds?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], short_channel_ids_arg: [UInt64]) {
    	
        self.cOpaqueStruct = QueryShortChannelIds_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), Bindings.new_LDKCVec_u64Z(array: short_channel_ids_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKQueryShortChannelIds){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryShortChannelIds>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryShortChannelIds_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func set_short_channel_ids(val: [UInt64]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryShortChannelIds>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryShortChannelIds_set_short_channel_ids(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    public func clone() -> QueryShortChannelIds {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds(pointer: QueryShortChannelIds_clone(origPointer))
};
    }

    public func read(ser: [UInt8]) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: QueryShortChannelIds_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds_write(objPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		QueryShortChannelIds_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

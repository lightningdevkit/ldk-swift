public class QueryShortChannelIds {

    var cOpaqueStruct: LDKQueryShortChannelIds?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], short_channel_ids_arg: [UInt64]) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
		let converted_short_channel_ids_arg = Bindings.new_LDKCVec_u64Z(array: short_channel_ids_arg)
        self.cOpaqueStruct = QueryShortChannelIds_new(converted_chain_hash_arg, converted_short_channel_ids_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKQueryShortChannelIds){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_get_chain_hash(this_ptrPointer).pointee;
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func set_short_channel_ids(val: [UInt64]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_short_channel_ids(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    public func clone(orig: QueryShortChannelIds) -> QueryShortChannelIds {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds(pointer: QueryShortChannelIds_clone(origPointer));
    }

    public func read(ser: [UInt8]) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: QueryShortChannelIds_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: QueryShortChannelIds) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: QueryShortChannelIds_write(objPointer));
    }

				
	deinit {
					
					
		QueryShortChannelIds_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

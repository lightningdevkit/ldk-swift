class QueryShortChannelIds {

    var cOpaqueStruct: LDKQueryShortChannelIds?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(chain_hash_arg: [UInt8], short_channel_ids_arg: [UInt64]) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
		let converted_short_channel_ids_arg = Bindings.new_LDKCVec_u64Z(array: short_channel_ids_arg)
        self.cOpaqueStruct = QueryShortChannelIds_new(converted_chain_hash_arg, converted_short_channel_ids_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKQueryShortChannelIds){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_get_chain_hash(this_ptrPointer).pointee;
    }

    func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func set_short_channel_ids(val: [UInt64]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_short_channel_ids(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    func clone(orig: QueryShortChannelIds) -> QueryShortChannelIds {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds(pointer: QueryShortChannelIds_clone(origPointer));
    }

    func read(ser: [UInt8]) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: QueryShortChannelIds_read(Bindings.new_LDKu8slice(array: ser)));
    }

    func write(obj: QueryShortChannelIds) -> [UInt8] {
    	
						
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

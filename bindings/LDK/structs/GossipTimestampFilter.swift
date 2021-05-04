class GossipTimestampFilter {

    var cOpaqueStruct: LDKGossipTimestampFilter?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(chain_hash_arg: [UInt8], first_timestamp_arg: UInt32, timestamp_range_arg: UInt32) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
        self.cOpaqueStruct = GossipTimestampFilter_new(converted_chain_hash_arg, first_timestamp_arg, timestamp_range_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKGossipTimestampFilter){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_chain_hash(this_ptrPointer).pointee;
    }

    func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_first_timestamp() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_first_timestamp(this_ptrPointer);
    }

    func set_first_timestamp(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_set_first_timestamp(this_ptrPointer, val);
    }

    func get_timestamp_range() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_timestamp_range(this_ptrPointer);
    }

    func set_timestamp_range(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_set_timestamp_range(this_ptrPointer, val);
    }

    func clone(orig: GossipTimestampFilter) -> GossipTimestampFilter {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter(pointer: GossipTimestampFilter_clone(origPointer));
    }

    func read(ser: [UInt8]) -> Result_GossipTimestampFilterDecodeErrorZ {
    	
        return Result_GossipTimestampFilterDecodeErrorZ(pointer: GossipTimestampFilter_read(Bindings.new_LDKu8slice(array: ser)));
    }

    func write(obj: GossipTimestampFilter) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: GossipTimestampFilter_write(objPointer));
    }

				
	deinit {
					
					
		GossipTimestampFilter_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

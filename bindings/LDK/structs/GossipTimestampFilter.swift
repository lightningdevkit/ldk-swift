class GossipTimestampFilter {

    var cOpaqueStruct: LDKGossipTimestampFilter?;

    init(chain_hash_arg: [U], first_timestamp_arg: U, timestamp_range_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = GossipTimestampFilter_new(chain_hash_arg, first_timestamp_arg, timestamp_range_arg)
    }

    private init(pointer: LDKGossipTimestampFilter){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_set_chain_hash(this_ptrPointer, val);
    }

    func get_first_timestamp() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_first_timestamp(this_ptrPointer);
    }

    func set_first_timestamp(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_set_first_timestamp(this_ptrPointer, val);
    }

    func get_timestamp_range() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_get_timestamp_range(this_ptrPointer);
    }

    func set_timestamp_range(val: U) -> Void {
    	
						
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

    func read(ser: [U]) -> Result_GossipTimestampFilterDecodeErrorZ {
    	
        return GossipTimestampFilter_read(ser);
    }

    func write(obj: GossipTimestampFilter) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKGossipTimestampFilter>) in
							
			pointer
						
		}
					
        return GossipTimestampFilter_write(objPointer);
    }

				
	deinit {
					
					
		GossipTimestampFilter_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

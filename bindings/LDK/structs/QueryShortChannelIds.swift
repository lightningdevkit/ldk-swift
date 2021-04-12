class QueryShortChannelIds {

    var cOpaqueStruct: LDKQueryShortChannelIds?;

    init(chain_hash_arg: [U], short_channel_ids_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = QueryShortChannelIds_new(chain_hash_arg, short_channel_ids_arg)
    }

    private init(pointer: LDKQueryShortChannelIds){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_chain_hash(this_ptrPointer, val);
    }

    func set_short_channel_ids(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_set_short_channel_ids(this_ptrPointer, val);
    }

    func clone(orig: QueryShortChannelIds) -> QueryShortChannelIds {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds(pointer: QueryShortChannelIds_clone(origPointer));
    }

    func read(ser: [U]) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
        return QueryShortChannelIds_read(ser);
    }

    func write(obj: QueryShortChannelIds) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryShortChannelIds>) in
							
			pointer
						
		}
					
        return QueryShortChannelIds_write(objPointer);
    }

				
	deinit {
					
					
		QueryShortChannelIds_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

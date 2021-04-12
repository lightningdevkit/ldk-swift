class QueryChannelRange {

    var cOpaqueStruct: LDKQueryChannelRange?;

    init(chain_hash_arg: [U], first_blocknum_arg: U, number_of_blocks_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = QueryChannelRange_new(chain_hash_arg, first_blocknum_arg, number_of_blocks_arg)
    }

    private init(pointer: LDKQueryChannelRange){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_chain_hash(this_ptrPointer, val);
    }

    func get_first_blocknum() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_first_blocknum(this_ptrPointer);
    }

    func set_first_blocknum(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    func get_number_of_blocks() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_number_of_blocks(this_ptrPointer);
    }

    func set_number_of_blocks(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    func clone(orig: QueryChannelRange) -> QueryChannelRange {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange(pointer: QueryChannelRange_clone(origPointer));
    }

    func end_blocknum(this_arg: QueryChannelRange) -> U {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_end_blocknum(this_argPointer);
    }

    func read(ser: [U]) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return QueryChannelRange_read(ser);
    }

    func write(obj: QueryChannelRange) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_write(objPointer);
    }

				
	deinit {
					
					
		QueryChannelRange_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

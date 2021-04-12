class ReplyChannelRange {

    var cOpaqueStruct: LDKReplyChannelRange?;

    init(chain_hash_arg: [U], first_blocknum_arg: U, number_of_blocks_arg: U, sync_complete_arg: boolean, short_channel_ids_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ReplyChannelRange_new(chain_hash_arg, first_blocknum_arg, number_of_blocks_arg, sync_complete_arg, short_channel_ids_arg)
    }

    private init(pointer: LDKReplyChannelRange){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_chain_hash(this_ptrPointer, val);
    }

    func get_first_blocknum() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_first_blocknum(this_ptrPointer);
    }

    func set_first_blocknum(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    func get_number_of_blocks() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_number_of_blocks(this_ptrPointer);
    }

    func set_number_of_blocks(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    func get_sync_complete() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_sync_complete(this_ptrPointer);
    }

    func set_sync_complete(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_sync_complete(this_ptrPointer, val);
    }

    func set_short_channel_ids(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_short_channel_ids(this_ptrPointer, val);
    }

    func clone(orig: ReplyChannelRange) -> ReplyChannelRange {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange(pointer: ReplyChannelRange_clone(origPointer));
    }

    func read(ser: [U]) -> Result_ReplyChannelRangeDecodeErrorZ {
    	
        return ReplyChannelRange_read(ser);
    }

    func write(obj: ReplyChannelRange) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_write(objPointer);
    }

				
	deinit {
					
					
		ReplyChannelRange_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

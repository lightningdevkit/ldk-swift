class ReplyShortChannelIdsEnd {

    var cOpaqueStruct: LDKReplyShortChannelIdsEnd?;

    init(chain_hash_arg: [U], full_information_arg: boolean) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ReplyShortChannelIdsEnd_new(chain_hash_arg, full_information_arg)
    }

    private init(pointer: LDKReplyShortChannelIdsEnd){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chain_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_get_chain_hash(this_ptrPointer);
    }

    func set_chain_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_set_chain_hash(this_ptrPointer, val);
    }

    func get_full_information() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_get_full_information(this_ptrPointer);
    }

    func set_full_information(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_set_full_information(this_ptrPointer, val);
    }

    func clone(orig: ReplyShortChannelIdsEnd) -> ReplyShortChannelIdsEnd {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd(pointer: ReplyShortChannelIdsEnd_clone(origPointer));
    }

    func read(ser: [U]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return ReplyShortChannelIdsEnd_read(ser);
    }

    func write(obj: ReplyShortChannelIdsEnd) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_write(objPointer);
    }

				
	deinit {
					
					
		ReplyShortChannelIdsEnd_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

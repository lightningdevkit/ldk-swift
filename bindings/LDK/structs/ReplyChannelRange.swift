public class ReplyChannelRange {

    var cOpaqueStruct: LDKReplyChannelRange?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], first_blocknum_arg: UInt32, number_of_blocks_arg: UInt32, sync_complete_arg: Bool, short_channel_ids_arg: [UInt64]) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
		let converted_short_channel_ids_arg = Bindings.new_LDKCVec_u64Z(array: short_channel_ids_arg)
        self.cOpaqueStruct = ReplyChannelRange_new(converted_chain_hash_arg, first_blocknum_arg, number_of_blocks_arg, sync_complete_arg, converted_short_channel_ids_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKReplyChannelRange){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_chain_hash(this_ptrPointer).pointee;
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_first_blocknum() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_first_blocknum(this_ptrPointer);
    }

    public func set_first_blocknum(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    public func get_number_of_blocks() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_number_of_blocks(this_ptrPointer);
    }

    public func set_number_of_blocks(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    public func get_sync_complete() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_get_sync_complete(this_ptrPointer);
    }

    public func set_sync_complete(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_sync_complete(this_ptrPointer, val);
    }

    public func set_short_channel_ids(val: [UInt64]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange_set_short_channel_ids(this_ptrPointer, Bindings.new_LDKCVec_u64Z(array: val));
    }

    public func clone(orig: ReplyChannelRange) -> ReplyChannelRange {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return ReplyChannelRange(pointer: ReplyChannelRange_clone(origPointer));
    }

    public func read(ser: [UInt8]) -> Result_ReplyChannelRangeDecodeErrorZ {
    	
        return Result_ReplyChannelRangeDecodeErrorZ(pointer: ReplyChannelRange_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: ReplyChannelRange) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyChannelRange>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ReplyChannelRange_write(objPointer));
    }

				
	deinit {
					
					
		ReplyChannelRange_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

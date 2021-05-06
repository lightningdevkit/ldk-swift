public class ReplyShortChannelIdsEnd {

    var cOpaqueStruct: LDKReplyShortChannelIdsEnd?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], full_information_arg: Bool) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
        self.cOpaqueStruct = ReplyShortChannelIdsEnd_new(converted_chain_hash_arg, full_information_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKReplyShortChannelIdsEnd){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_get_chain_hash(this_ptrPointer).pointee;
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_full_information() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_get_full_information(this_ptrPointer);
    }

    public func set_full_information(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd_set_full_information(this_ptrPointer, val);
    }

    public func clone(orig: ReplyShortChannelIdsEnd) -> ReplyShortChannelIdsEnd {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return ReplyShortChannelIdsEnd(pointer: ReplyShortChannelIdsEnd_clone(origPointer));
    }

    public func read(ser: [UInt8]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: ReplyShortChannelIdsEnd_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: ReplyShortChannelIdsEnd) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ReplyShortChannelIdsEnd_write(objPointer));
    }

				
	deinit {
					
					
		ReplyShortChannelIdsEnd_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

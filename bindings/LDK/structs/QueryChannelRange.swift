public class QueryChannelRange {

    var cOpaqueStruct: LDKQueryChannelRange?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], first_blocknum_arg: UInt32, number_of_blocks_arg: UInt32) {
    	
		let converted_chain_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg)
        self.cOpaqueStruct = QueryChannelRange_new(converted_chain_hash_arg, first_blocknum_arg, number_of_blocks_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKQueryChannelRange){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_chain_hash(this_ptrPointer).pointee;
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_first_blocknum() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_first_blocknum(this_ptrPointer);
    }

    public func set_first_blocknum(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    public func get_number_of_blocks() -> UInt32 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_get_number_of_blocks(this_ptrPointer);
    }

    public func set_number_of_blocks(val: UInt32) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    public func clone(orig: QueryChannelRange) -> QueryChannelRange {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange(pointer: QueryChannelRange_clone(origPointer));
    }

    public func end_blocknum(this_arg: QueryChannelRange) -> UInt32 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return QueryChannelRange_end_blocknum(this_argPointer);
    }

    public func read(ser: [UInt8]) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: QueryChannelRange_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write(obj: QueryChannelRange) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKQueryChannelRange>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: QueryChannelRange_write(objPointer));
    }

				
	deinit {
					
					
		QueryChannelRange_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

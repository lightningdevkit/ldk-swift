public class QueryChannelRange {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKQueryChannelRange?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], first_blocknum_arg: UInt32, number_of_blocks_arg: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = QueryChannelRange_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), first_blocknum_arg, number_of_blocks_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKQueryChannelRange){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryChannelRange_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_first_blocknum() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange_get_first_blocknum(this_ptrPointer)
};
    }

    public func set_first_blocknum(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryChannelRange_set_first_blocknum(this_ptrPointer, val);
    }

    public func get_number_of_blocks() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange_get_number_of_blocks(this_ptrPointer)
};
    }

    public func set_number_of_blocks(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryChannelRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryChannelRange_set_number_of_blocks(this_ptrPointer, val);
    }

    public func clone() -> QueryChannelRange {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange(pointer: QueryChannelRange_clone(origPointer))
};
    }

    public func end_blocknum() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange_end_blocknum(this_argPointer)
};
    }

    public class func read(ser: [UInt8]) -> Result_QueryChannelRangeDecodeErrorZ {
    	
        return Result_QueryChannelRangeDecodeErrorZ(pointer: QueryChannelRange_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKQueryChannelRange>) in
QueryChannelRange_write(objPointer)
});
    }

				
	deinit {
					
					
					
		QueryChannelRange_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

public class BestBlock {

    var cOpaqueStruct: LDKBestBlock?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(block_hash: [UInt8], height: UInt32) {
    	
		let converted_block_hash = Bindings.new_LDKThirtyTwoBytes(array: block_hash)
        self.cOpaqueStruct = BestBlock_new(converted_block_hash, height)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKBestBlock){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: BestBlock) -> BestBlock {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBestBlock>) in
BestBlock(pointer: BestBlock_clone(origPointer))
};
    }

    public func block_hash(this_arg: BestBlock) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBestBlock>) in
BestBlock_block_hash(this_argPointer)
});
    }

    public func height(this_arg: BestBlock) -> UInt32 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBestBlock>) in
BestBlock_height(this_argPointer)
};
    }

				
	deinit {
					
					
		BestBlock_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

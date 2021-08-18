public class BestBlock {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKBestBlock?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(block_hash: [UInt8], height: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = BestBlock_new(Bindings.new_LDKThirtyTwoBytes(array: block_hash), height)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKBestBlock){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> BestBlock {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBestBlock>) in
BestBlock(pointer: BestBlock_clone(origPointer))
};
    }

    public func block_hash() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBestBlock>) in
BestBlock_block_hash(this_argPointer)
});
    }

    public func height() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBestBlock>) in
BestBlock_height(this_argPointer)
};
    }

				
	deinit {
					
					
					
		BestBlock_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

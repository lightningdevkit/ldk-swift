public class ChainParameters {

    var cOpaqueStruct: LDKChainParameters?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(network_arg: LDKNetwork, best_block_arg: BestBlock) {
    	
        self.cOpaqueStruct = ChainParameters_new(network_arg, best_block_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChainParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_network() -> LDKNetwork {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_network(this_ptrPointer)
};
    }

    public func set_network(val: LDKNetwork) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChainParameters>) in
ChainParameters_set_network(this_ptrPointer, val)
};
    }

    public func get_best_block() -> BestBlock {
    	/* NATIVE_CALL_PREP */
        return BestBlock(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_best_block(this_ptrPointer)
});
    }

    public func set_best_block(val: BestBlock) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChainParameters>) in
ChainParameters_set_best_block(this_ptrPointer, val.cOpaqueStruct!)
};
    }

				
	deinit {
					
					
		ChainParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

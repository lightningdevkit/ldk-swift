public class ChainParameters {

    public internal(set) var cOpaqueStruct: LDKChainParameters?;

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
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_network(this_ptrPointer)
};
    }

    public func set_network(val: LDKNetwork) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChainParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChainParameters_set_network(this_ptrPointer, val);
    }

    public func get_best_block() -> BestBlock {
    	
        return BestBlock(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_best_block(this_ptrPointer)
});
    }

    public func set_best_block(val: BestBlock) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChainParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChainParameters_set_best_block(this_ptrPointer, val.cOpaqueStruct!);
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChainParameters_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

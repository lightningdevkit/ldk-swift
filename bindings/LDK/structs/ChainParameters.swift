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
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_get_network(this_ptrPointer);
    }

    public func set_network(val: LDKNetwork) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_set_network(this_ptrPointer, val);
    }

    public func get_best_block() -> BestBlock {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return BestBlock(pointer: ChainParameters_get_best_block(this_ptrPointer));
    }

    public func set_best_block(val: BestBlock) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_set_best_block(this_ptrPointer, val.cOpaqueStruct!);
    }

				
	deinit {
					
					
		ChainParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

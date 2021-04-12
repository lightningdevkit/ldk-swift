class ChainParameters {

    var cOpaqueStruct: LDKChainParameters?;

    init(network_arg: Network, latest_hash_arg: [U], latest_height_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChainParameters_new(network_arg, latest_hash_arg, latest_height_arg)
    }

    private init(pointer: LDKChainParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_network() -> Network {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_get_network(this_ptrPointer);
    }

    func set_network(val: Network) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_set_network(this_ptrPointer, val);
    }

    func get_latest_hash() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_get_latest_hash(this_ptrPointer);
    }

    func set_latest_hash(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_set_latest_hash(this_ptrPointer, val);
    }

    func get_latest_height() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_get_latest_height(this_ptrPointer);
    }

    func set_latest_height(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChainParameters>) in
							
			pointer
						
		}
					
        return ChainParameters_set_latest_height(this_ptrPointer, val);
    }

				
	deinit {
					
					
		ChainParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

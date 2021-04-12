class LockedNetworkGraph {

    var cOpaqueStruct: LDKLockedNetworkGraph?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKLockedNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func graph(this_arg: LockedNetworkGraph) -> NetworkGraph {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLockedNetworkGraph>) in
							
			pointer
						
		}
					
        return LockedNetworkGraph_graph(this_argPointer);
    }

				
	deinit {
					
					
		LockedNetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

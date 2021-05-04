class LockedNetworkGraph {

    var cOpaqueStruct: LDKLockedNetworkGraph?;

	

    init(pointer: LDKLockedNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func graph(this_arg: LockedNetworkGraph) -> NetworkGraph {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLockedNetworkGraph>) in
							
			pointer
						
		}
					
        return NetworkGraph(pointer: LockedNetworkGraph_graph(this_argPointer));
    }

				
	deinit {
					
					
		LockedNetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

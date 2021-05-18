public class LockedNetworkGraph {

    var cOpaqueStruct: LDKLockedNetworkGraph?;

	

    public init(pointer: LDKLockedNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func graph(this_arg: LockedNetworkGraph) -> NetworkGraph {
    	
        return NetworkGraph(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKLockedNetworkGraph>) in
LockedNetworkGraph_graph(this_argPointer)
});
    }

				
	deinit {
					
					
		LockedNetworkGraph_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

import LDKHeaders

public class LockedNetworkGraph {

    public internal(set) var cOpaqueStruct: LDKLockedNetworkGraph?;

	

    public init(pointer: LDKLockedNetworkGraph){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func graph() -> NetworkGraph {
    	
        return NetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKLockedNetworkGraph>) in
LockedNetworkGraph_graph(this_argPointer)
});
    }

				
	deinit {
					
					
					
		LockedNetworkGraph_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

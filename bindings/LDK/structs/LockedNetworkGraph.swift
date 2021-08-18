import LDKHeaders

public class LockedNetworkGraph {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKLockedNetworkGraph?;


	

    public init(pointer: LDKLockedNetworkGraph){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func graph() -> NetworkGraph {
    	
        return NetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKLockedNetworkGraph>) in
LockedNetworkGraph_graph(this_argPointer)
});
    }

    internal func free() -> Void {
    	
        return LockedNetworkGraph_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> LockedNetworkGraph {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing LockedNetworkGraph \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing LockedNetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

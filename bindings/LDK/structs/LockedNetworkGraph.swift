import LDKHeaders

public class LockedNetworkGraph: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKLockedNetworkGraph?


	

    public init(pointer: LDKLockedNetworkGraph){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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

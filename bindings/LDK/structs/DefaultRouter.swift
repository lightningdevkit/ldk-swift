public class DefaultRouter: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKDefaultRouter?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(network_graph: NetworkGraph, logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
DefaultRouter_new(network_graphPointer, logger.cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
        /* POST_INIT_ANCHORING */
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKDefaultRouter){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKDefaultRouter, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func as_Router() -> NativelyImplementedRouter {
    	
        return NativelyImplementedRouter(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDefaultRouter>) in
DefaultRouter_as_Router(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return DefaultRouter_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DefaultRouter {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing DefaultRouter \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DefaultRouter \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

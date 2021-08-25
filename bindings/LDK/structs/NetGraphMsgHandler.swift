public class NetGraphMsgHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKNetGraphMsgHandler?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_access: Access?, logger: Logger, network_graph: NetworkGraph) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
							var chain_accessPointer: UnsafeMutablePointer<LDKAccess>? = nil
							if let chain_accessUnwrapped = chain_access {
								chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
								chain_accessPointer!.initialize(to: chain_accessUnwrapped.cOpaqueStruct!)
							}
						
        self.cOpaqueStruct = NetGraphMsgHandler_from_net_graph(chain_accessPointer, logger.cOpaqueStruct!, network_graph.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNetGraphMsgHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func add_chain_access(chain_access: Access?) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetGraphMsgHandler>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
							var chain_accessPointer: UnsafeMutablePointer<LDKAccess>? = nil
							if let chain_accessUnwrapped = chain_access {
								chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
								chain_accessPointer!.initialize(to: chain_accessUnwrapped.cOpaqueStruct!)
							}
						
        return NetGraphMsgHandler_add_chain_access(this_argPointer, chain_accessPointer);
    }

    public func read_locked_graph() -> LockedNetworkGraph {
    	
        return LockedNetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_read_locked_graph(this_argPointer)
});
    }

    public func as_RoutingMessageHandler() -> RoutingMessageHandler {
    	
        return NativelyImplementedRoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_RoutingMessageHandler(this_argPointer)
}, anchor: self);
    }

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return NativelyImplementedMessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_MessageSendEventsProvider(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return NetGraphMsgHandler_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NetGraphMsgHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing NetGraphMsgHandler \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing NetGraphMsgHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

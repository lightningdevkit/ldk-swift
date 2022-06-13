public class NetGraphMsgHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKNetGraphMsgHandler?


	/* DEFAULT_CONSTRUCTOR_START */
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(network_graph: NetworkGraph, chain_access: Option_AccessZ, logger: Logger) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
NetGraphMsgHandler_new(network_graphPointer, chain_access.cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
        super.init(conflictAvoidingVariableName: 0)
        try? self.addAnchor(anchor: chain_access)
try? self.addAnchor(anchor: logger)

    }
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKNetGraphMsgHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKNetGraphMsgHandler, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func as_EventHandler() -> NativelyImplementedEventHandler {
    	
        return NativelyImplementedEventHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_EventHandler(this_argPointer)
}, anchor: self);
    }

    public func add_chain_access(chain_access: Option_AccessZ) -> Void {
    	
							let this_argPointer = UnsafeMutablePointer<LDKNetGraphMsgHandler>.allocate(capacity: 1)
							this_argPointer.initialize(to: self.cOpaqueStruct!)
						
        return NetGraphMsgHandler_add_chain_access(this_argPointer, chain_access.cOpaqueStruct!);
    }

    public func as_RoutingMessageHandler() -> NativelyImplementedRoutingMessageHandler {
    	
        return NativelyImplementedRoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_RoutingMessageHandler(this_argPointer)
}, anchor: self);
    }

    public func as_MessageSendEventsProvider() -> NativelyImplementedMessageSendEventsProvider {
    	
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
							Bindings.print("Freeing NetGraphMsgHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NetGraphMsgHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

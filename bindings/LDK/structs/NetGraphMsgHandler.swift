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
    	
        self.cOpaqueStruct = NetGraphMsgHandler_new(network_graph.danglingClone().cOpaqueStruct!, chain_access.cOpaqueStruct!, logger.cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
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

    public func get_network_graph() -> NetworkGraph {
    	
        return NetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_get_network_graph(this_ptrPointer)
});
    }

    public func set_network_graph(val: NetworkGraph) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNetGraphMsgHandler>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NetGraphMsgHandler_set_network_graph(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
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

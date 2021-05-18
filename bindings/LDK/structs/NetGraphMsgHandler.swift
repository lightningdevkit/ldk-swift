public class NetGraphMsgHandler {

    var cOpaqueStruct: LDKNetGraphMsgHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_access: Access, logger: Logger, network_graph: NetworkGraph) {
    	
						let chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
						chain_accessPointer.initialize(to: chain_access.cOpaqueStruct!)
					
        self.cOpaqueStruct = NetGraphMsgHandler_from_net_graph(chain_accessPointer, logger.cOpaqueStruct!, network_graph.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNetGraphMsgHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func add_chain_access(this_arg: NetGraphMsgHandler, chain_access: Access) -> Void {
    	
						let this_argPointer = UnsafeMutablePointer<LDKNetGraphMsgHandler>.allocate(capacity: 1)
						this_argPointer.initialize(to: this_arg.cOpaqueStruct!)
					
						let chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
						chain_accessPointer.initialize(to: chain_access.cOpaqueStruct!)
					
        return NetGraphMsgHandler_add_chain_access(this_argPointer, chain_accessPointer);
    }

    public func read_locked_graph(this_arg: NetGraphMsgHandler) -> LockedNetworkGraph {
    	
        return LockedNetworkGraph(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_read_locked_graph(this_argPointer)
});
    }

    public func as_RoutingMessageHandler(this_arg: NetGraphMsgHandler) -> RoutingMessageHandler {
    	
        return RoutingMessageHandler(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_RoutingMessageHandler(this_argPointer)
});
    }

    public func as_MessageSendEventsProvider(this_arg: NetGraphMsgHandler) -> MessageSendEventsProvider {
    	
        return MessageSendEventsProvider(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

				
	deinit {
					
					
		NetGraphMsgHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

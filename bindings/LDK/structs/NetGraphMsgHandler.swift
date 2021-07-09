public class NetGraphMsgHandler {

    public internal(set) var cOpaqueStruct: LDKNetGraphMsgHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_access: Access?, logger: Logger, network_graph: NetworkGraph) {
    	
							var chain_accessPointer: UnsafeMutablePointer<LDKAccess>? = nil
							if let chain_accessUnwrapped = chain_access {
								chain_accessPointer = UnsafeMutablePointer<LDKAccess>.allocate(capacity: 1)
								chain_accessPointer!.initialize(to: chain_accessUnwrapped.cOpaqueStruct!)
							}
						
        self.cOpaqueStruct = NetGraphMsgHandler_from_net_graph(chain_accessPointer, logger.cOpaqueStruct!, network_graph.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNetGraphMsgHandler){
		self.cOpaqueStruct = pointer
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
});
    }

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return NativelyImplementedMessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetGraphMsgHandler>) in
NetGraphMsgHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		NetGraphMsgHandler_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

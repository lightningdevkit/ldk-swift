public class IgnoringMessageHandler {

    var cOpaqueStruct: LDKIgnoringMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = IgnoringMessageHandler_new()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKIgnoringMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider(this_arg: IgnoringMessageHandler) -> MessageSendEventsProvider {
    	
        return MessageSendEventsProvider(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

    public func as_RoutingMessageHandler(this_arg: IgnoringMessageHandler) -> RoutingMessageHandler {
    	
        return RoutingMessageHandler(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_RoutingMessageHandler(this_argPointer)
});
    }

				
	deinit {
					
					
		IgnoringMessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

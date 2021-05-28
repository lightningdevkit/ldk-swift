public class IgnoringMessageHandler {

    public internal(set) var cOpaqueStruct: LDKIgnoringMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = IgnoringMessageHandler_new()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKIgnoringMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return MessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

    public func as_RoutingMessageHandler() -> RoutingMessageHandler {
    	
        return RoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_RoutingMessageHandler(this_argPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		IgnoringMessageHandler_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

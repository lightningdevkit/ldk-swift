public class ErroringMessageHandler {

    var cOpaqueStruct: LDKErroringMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = ErroringMessageHandler_new()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErroringMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider(this_arg: ErroringMessageHandler) -> MessageSendEventsProvider {
    	
        return MessageSendEventsProvider(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

    public func as_ChannelMessageHandler(this_arg: ErroringMessageHandler) -> ChannelMessageHandler {
    	
        return ChannelMessageHandler(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_ChannelMessageHandler(this_argPointer)
});
    }

				
	deinit {
					
					
		ErroringMessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

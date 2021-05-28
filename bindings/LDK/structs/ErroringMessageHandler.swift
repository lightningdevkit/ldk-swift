public class ErroringMessageHandler {

    public internal(set) var cOpaqueStruct: LDKErroringMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = ErroringMessageHandler_new()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErroringMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return MessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
});
    }

    public func as_ChannelMessageHandler() -> ChannelMessageHandler {
    	
        return ChannelMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_ChannelMessageHandler(this_argPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ErroringMessageHandler_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

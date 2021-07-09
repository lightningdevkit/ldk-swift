public class MessageHandler {

    var cOpaqueStruct: LDKMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chan_handler_arg: ChannelMessageHandler, route_handler_arg: RoutingMessageHandler) {
    	
        self.cOpaqueStruct = MessageHandler_new(chan_handler_arg.cOpaqueStruct!, route_handler_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chan_handler() -> ChannelMessageHandler {
    	/* NATIVE_CALL_PREP */
        return ChannelMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMessageHandler>) in
MessageHandler_get_chan_handler(this_ptrPointer)
}.pointee);
    }

    public func set_chan_handler(val: ChannelMessageHandler) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKMessageHandler>) in
MessageHandler_set_chan_handler(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_route_handler() -> RoutingMessageHandler {
    	/* NATIVE_CALL_PREP */
        return RoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMessageHandler>) in
MessageHandler_get_route_handler(this_ptrPointer)
}.pointee);
    }

    public func set_route_handler(val: RoutingMessageHandler) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKMessageHandler>) in
MessageHandler_set_route_handler(this_ptrPointer, val.cOpaqueStruct!)
};
    }

				
	deinit {
					
					
		MessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

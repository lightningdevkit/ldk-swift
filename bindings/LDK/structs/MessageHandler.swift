class MessageHandler {

    var cOpaqueStruct: LDKMessageHandler?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(chan_handler_arg: ChannelMessageHandler, route_handler_arg: RoutingMessageHandler) {
    	
        self.cOpaqueStruct = MessageHandler_new(chan_handler_arg.cOpaqueStruct!, route_handler_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chan_handler() -> ChannelMessageHandler {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return ChannelMessageHandler(pointer: MessageHandler_get_chan_handler(this_ptrPointer).pointee);
    }

    func set_chan_handler(val: ChannelMessageHandler) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_set_chan_handler(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_route_handler() -> RoutingMessageHandler {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return RoutingMessageHandler(pointer: MessageHandler_get_route_handler(this_ptrPointer).pointee);
    }

    func set_route_handler(val: RoutingMessageHandler) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_set_route_handler(this_ptrPointer, val.cOpaqueStruct!);
    }

				
	deinit {
					
					
		MessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

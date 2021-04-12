class MessageHandler {

    var cOpaqueStruct: LDKMessageHandler?;

    init(chan_handler_arg: ChannelMessageHandler, route_handler_arg: RoutingMessageHandler) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = MessageHandler_new(chan_handler_arg, route_handler_arg)
    }

    private init(pointer: LDKMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_chan_handler() -> ChannelMessageHandler {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_get_chan_handler(this_ptrPointer);
    }

    func set_chan_handler(val: ChannelMessageHandler) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_set_chan_handler(this_ptrPointer, val);
    }

    func get_route_handler() -> RoutingMessageHandler {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_get_route_handler(this_ptrPointer);
    }

    func set_route_handler(val: RoutingMessageHandler) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKMessageHandler>) in
							
			pointer
						
		}
					
        return MessageHandler_set_route_handler(this_ptrPointer, val);
    }

				
	deinit {
					
					
		MessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

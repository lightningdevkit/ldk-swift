class ErroringMessageHandler {

    var cOpaqueStruct: LDKErroringMessageHandler?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ErroringMessageHandler_new()
    }

    private init(pointer: LDKErroringMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func as_MessageSendEventsProvider(this_arg: ErroringMessageHandler) -> MessageSendEventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErroringMessageHandler>) in
							
			pointer
						
		}
					
        return ErroringMessageHandler_as_MessageSendEventsProvider(this_argPointer);
    }

    func as_ChannelMessageHandler(this_arg: ErroringMessageHandler) -> ChannelMessageHandler {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErroringMessageHandler>) in
							
			pointer
						
		}
					
        return ErroringMessageHandler_as_ChannelMessageHandler(this_argPointer);
    }

				
	deinit {
					
					
		ErroringMessageHandler_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

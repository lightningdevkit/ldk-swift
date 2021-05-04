class MessageSendEventsProvider {

    var cOpaqueStruct: LDKMessageSendEventsProvider?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func get_and_clear_pending_msg_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_MessageSendEventZ {
			let instance: MessageSendEventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKCVec_MessageSendEventZ(array: instance.get_and_clear_pending_msg_events());
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: MessageSendEventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKMessageSendEventsProvider(this_arg: Bindings.instanceToPointer(instance: self), 
			get_and_clear_pending_msg_events: get_and_clear_pending_msg_eventsCallback,
			free: freeCallback)
    }

    init(pointer: LDKMessageSendEventsProvider){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func get_and_clear_pending_msg_events() -> [LDKMessageSendEvent] {
    	/* EDIT ME */
		return [LDKMessageSendEvent]()
    }

    func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}

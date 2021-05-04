class EventsProvider {

    var cOpaqueStruct: LDKEventsProvider?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func get_and_clear_pending_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_EventZ {
			let instance: EventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_and_clear_pending_events();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: EventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKEventsProvider(this_arg: Bindings.instanceToPointer(instance: self), get_and_clear_pending_events: get_and_clear_pending_eventsCallback,
			free: freeCallback)
    }

    init(pointer: LDKEventsProvider){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func get_and_clear_pending_events() -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}

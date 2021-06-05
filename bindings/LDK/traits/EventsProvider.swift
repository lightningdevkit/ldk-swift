open class EventsProvider {

    public var cOpaqueStruct: LDKEventsProvider?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func get_and_clear_pending_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_EventZ {
			let instance: EventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			
			return Bindings.new_LDKCVec_EventZ(array: instance.get_and_clear_pending_events());
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: EventsProvider = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKEventsProvider(this_arg: Bindings.instanceToPointer(instance: self), 
			get_and_clear_pending_events: get_and_clear_pending_eventsCallback,
			free: freeCallback)
    }

    public init(pointer: LDKEventsProvider){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func get_and_clear_pending_events() -> [LDKEvent] {
    	/* EDIT ME */
		return [LDKEvent]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedEventsProvider: EventsProvider {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_and_clear_pending_events() -> [LDKEvent] {
		
				return 
				Bindings.LDKCVec_EventZ_to_array(nativeType: self.cOpaqueStruct!.get_and_clear_pending_events(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

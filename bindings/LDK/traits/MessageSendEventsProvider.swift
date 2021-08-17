import LDKHeaders

open class MessageSendEventsProvider {

    public var cOpaqueStruct: LDKMessageSendEventsProvider?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func get_and_clear_pending_msg_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_MessageSendEventZ {
			let instance: MessageSendEventsProvider = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "MessageSendEventsProvider.swift::get_and_clear_pending_msg_events")
			
			return Bindings.new_LDKCVec_MessageSendEventZ(array: instance.get_and_clear_pending_msg_events());
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: MessageSendEventsProvider = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "MessageSendEventsProvider.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKMessageSendEventsProvider(this_arg: Bindings.instanceToPointer(instance: self), 
			get_and_clear_pending_msg_events: get_and_clear_pending_msg_eventsCallback,
			free: freeCallback)
    }

    public init(pointer: LDKMessageSendEventsProvider){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func get_and_clear_pending_msg_events() -> [LDKMessageSendEvent] {
    	/* EDIT ME */
		return [LDKMessageSendEvent]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedMessageSendEventsProvider: MessageSendEventsProvider {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func get_and_clear_pending_msg_events() -> [LDKMessageSendEvent] {
		
				return 
				Bindings.LDKCVec_MessageSendEventZ_to_array(nativeType: self.cOpaqueStruct!.get_and_clear_pending_msg_events(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

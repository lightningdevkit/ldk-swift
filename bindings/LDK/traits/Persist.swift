class Persist {

    var cOpaqueStruct: LDKPersist?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func persist_new_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, data: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.persist_new_channel(id: id, data: data);
		}

		func update_persisted_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, update: UnsafePointer<LDKChannelMonitorUpdate>, data: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.update_persisted_channel(id: id, update: update, data: data);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKPersist(this_arg: Bindings.instanceToPointer(instance: self), persist_new_channel: persist_new_channelCallback,
			update_persisted_channel: update_persisted_channelCallback,
			free: freeCallback)
    }

    init(pointer: LDKPersist){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func persist_new_channel(id: LDKOutPoint, data: UnsafePointer<LDKChannelMonitor>) -> Void {
    	/* EDIT ME */
    }

    func update_persisted_channel(id: LDKOutPoint, update: UnsafePointer<LDKChannelMonitorUpdate>, data: UnsafePointer<LDKChannelMonitor>) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}

class Watch {

    var cOpaqueStruct: LDKWatch?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func watch_channelCallback(pointer: UnsafeRawPointer?, funding_txo: LDKOutPoint, monitor: LDKChannelMonitor) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.watch_channel(funding_txo: funding_txo, monitor: monitor);
		}

		func update_channelCallback(pointer: UnsafeRawPointer?, funding_txo: LDKOutPoint, update: LDKChannelMonitorUpdate) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.update_channel(funding_txo: funding_txo, update: update);
		}

		func release_pending_monitor_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_MonitorEventZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.release_pending_monitor_events();
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKWatch(this_arg: Bindings.instanceToPointer(instance: self), watch_channel: watch_channelCallback,
			update_channel: update_channelCallback,
			release_pending_monitor_events: release_pending_monitor_eventsCallback,
			free: freeCallback)
    }

    init(pointer: LDKWatch){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func watch_channel(funding_txo: LDKOutPoint, monitor: LDKChannelMonitor) -> Void {
    	/* EDIT ME */
    }

    func update_channel(funding_txo: LDKOutPoint, update: LDKChannelMonitorUpdate) -> Void {
    	/* EDIT ME */
    }

    func release_pending_monitor_events() -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}

open class Persist {

    public var cOpaqueStruct: LDKPersist?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func persist_new_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, dataPointer: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			let data = ChannelMonitor(pointer: dataPointer.pointee);

			return instance.persist_new_channel(id: OutPoint(pointer: id), data: data).cOpaqueStruct!;
		}

		func update_persisted_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, updatePointer: UnsafePointer<LDKChannelMonitorUpdate>, dataPointer: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			let update = ChannelMonitorUpdate(pointer: updatePointer.pointee);
let data = ChannelMonitor(pointer: dataPointer.pointee);

			return instance.update_persisted_channel(id: OutPoint(pointer: id), update: update, data: data).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKPersist(this_arg: Bindings.instanceToPointer(instance: self), 
			persist_new_channel: persist_new_channelCallback,
			update_persisted_channel: update_persisted_channelCallback,
			free: freeCallback)
    }

    public init(pointer: LDKPersist){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
    }

    open func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}

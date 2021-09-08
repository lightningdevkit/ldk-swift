open class Persist: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPersist?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func persist_new_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, dataPointer: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persist.swift::persist_new_channel")
			let data = ChannelMonitor(pointer: dataPointer.pointee);

			return instance.persist_new_channel(id: OutPoint(pointer: id), data: data).cOpaqueStruct!
		}

		func update_persisted_channelCallback(pointer: UnsafeRawPointer?, id: LDKOutPoint, updatePointer: UnsafePointer<LDKChannelMonitorUpdate>, dataPointer: UnsafePointer<LDKChannelMonitor>) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persist.swift::update_persisted_channel")
			let update = ChannelMonitorUpdate(pointer: updatePointer.pointee);
let data = ChannelMonitor(pointer: dataPointer.pointee);

			return instance.update_persisted_channel(id: OutPoint(pointer: id), update: update, data: data).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Persist = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Persist.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKPersist(this_arg: Bindings.instanceToPointer(instance: self), 
			persist_new_channel: persist_new_channelCallback,
			update_persisted_channel: update_persisted_channelCallback,
			free: freeCallback)

    }

    public init(pointer: LDKPersist){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPersist, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Persist {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Persist \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Persist \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		Bindings.print("Persist::persist_new_channel should be overridden!", severity: .WARNING)

return Result_NoneChannelMonitorUpdateErrZ()
    }

    open func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		Bindings.print("Persist::update_persisted_channel should be overridden!", severity: .WARNING)

return Result_NoneChannelMonitorUpdateErrZ()
    }

    open func free() -> Void {
    	/* EDIT ME */
		Bindings.print("Persist::free should be overridden!", severity: .WARNING)


    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedPersist: Persist {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
		
				
				return withUnsafePointer(to: data.cOpaqueStruct!) { (dataPointer: UnsafePointer<LDKChannelMonitor>) in

				Result_NoneChannelMonitorUpdateErrZ(pointer: self.cOpaqueStruct!.persist_new_channel(self.cOpaqueStruct!.this_arg, id.danglingClone().cOpaqueStruct!, dataPointer))
				
}
			
	}

	public override func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
		
				
				return withUnsafePointer(to: update.cOpaqueStruct!) { (updatePointer: UnsafePointer<LDKChannelMonitorUpdate>) in
withUnsafePointer(to: data.cOpaqueStruct!) { (dataPointer: UnsafePointer<LDKChannelMonitor>) in

				Result_NoneChannelMonitorUpdateErrZ(pointer: self.cOpaqueStruct!.update_persisted_channel(self.cOpaqueStruct!.this_arg, id.danglingClone().cOpaqueStruct!, updatePointer, dataPointer))
				
}
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

import LDKHeaders

open class Watch: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public var cOpaqueStruct: LDKWatch?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func watch_channelCallback(pointer: UnsafeRawPointer?, funding_txo: LDKOutPoint, monitor: LDKChannelMonitor) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Watch.swift::watch_channel")
			
			return instance.watch_channel(funding_txo: OutPoint(pointer: funding_txo), monitor: ChannelMonitor(pointer: monitor)).cOpaqueStruct!
		}

		func update_channelCallback(pointer: UnsafeRawPointer?, funding_txo: LDKOutPoint, update: LDKChannelMonitorUpdate) -> LDKCResult_NoneChannelMonitorUpdateErrZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Watch.swift::update_channel")
			
			return instance.update_channel(funding_txo: OutPoint(pointer: funding_txo), update: ChannelMonitorUpdate(pointer: update)).cOpaqueStruct!
		}

		func release_pending_monitor_eventsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_MonitorEventZ {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Watch.swift::release_pending_monitor_events")
			
			
					let returnWrapper = Bindings.new_LDKCVec_MonitorEventZWrapper(array: instance.release_pending_monitor_events())
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Watch = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "Watch.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKWatch(this_arg: Bindings.instanceToPointer(instance: self), 
			watch_channel: watch_channelCallback,
			update_channel: update_channelCallback,
			release_pending_monitor_events: release_pending_monitor_eventsCallback,
			free: freeCallback)

    }

    public init(pointer: LDKWatch){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKWatch, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> Watch {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Watch \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Watch \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func watch_channel(funding_txo: OutPoint, monitor: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
    }

    open func update_channel(funding_txo: OutPoint, update: ChannelMonitorUpdate) -> Result_NoneChannelMonitorUpdateErrZ {
    	/* EDIT ME */
		return Result_NoneChannelMonitorUpdateErrZ(pointer: LDKCResult_NoneChannelMonitorUpdateErrZ())
    }

    open func release_pending_monitor_events() -> [LDKMonitorEvent] {
    	/* EDIT ME */
		return [LDKMonitorEvent]()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedWatch: Watch {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func watch_channel(funding_txo: OutPoint, monitor: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
		
				
				return 
				Result_NoneChannelMonitorUpdateErrZ(pointer: self.cOpaqueStruct!.watch_channel(self.cOpaqueStruct!.this_arg, funding_txo.dangle().danglingClone().cOpaqueStruct!, monitor.dangle().danglingClone().cOpaqueStruct!))
				
			
	}

	public override func update_channel(funding_txo: OutPoint, update: ChannelMonitorUpdate) -> Result_NoneChannelMonitorUpdateErrZ {
		
				
				return 
				Result_NoneChannelMonitorUpdateErrZ(pointer: self.cOpaqueStruct!.update_channel(self.cOpaqueStruct!.this_arg, funding_txo.danglingClone().cOpaqueStruct!, update.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func release_pending_monitor_events() -> [LDKMonitorEvent] {
		
				
				return 
				Bindings.LDKCVec_MonitorEventZ_to_array(nativeType: self.cOpaqueStruct!.release_pending_monitor_events(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

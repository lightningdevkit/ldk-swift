import LDKHeaders

open class ChannelManagerPersister {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKChannelManagerPersister?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func persist_managerCallback(pointer: UnsafeRawPointer?, channel_managerPointer: UnsafePointer<LDKChannelManager>) -> LDKCResult_NoneErrorZ {
			let instance: ChannelManagerPersister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelManagerPersister.swift::persist_manager")
			let channel_manager = ChannelManager(pointer: channel_managerPointer.pointee);

			return instance.persist_manager(channel_manager: channel_manager).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: ChannelManagerPersister = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelManagerPersister.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKChannelManagerPersister(this_arg: Bindings.instanceToPointer(instance: self), 
			persist_manager: persist_managerCallback,
			free: freeCallback)
    }

    public init(pointer: LDKChannelManagerPersister){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKChannelManagerPersister, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> ChannelManagerPersister {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChannelManagerPersister \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChannelManagerPersister \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
    	/* EDIT ME */
		return Result_NoneErrorZ(pointer: LDKCResult_NoneErrorZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedChannelManagerPersister: ChannelManagerPersister {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
		
				return withUnsafePointer(to: channel_manager.cOpaqueStruct!) { (channel_managerPointer: UnsafePointer<LDKChannelManager>) in

				Result_NoneErrorZ(pointer: self.cOpaqueStruct!.persist_manager(self.cOpaqueStruct!.this_arg, channel_managerPointer))
				
}
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

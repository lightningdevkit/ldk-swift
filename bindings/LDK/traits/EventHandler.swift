import Foundation

open class EventHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKEventHandler?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_eventCallback(pointer: UnsafeRawPointer?, eventPointer: UnsafePointer<LDKEvent>) -> Void {
			let instance: EventHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "EventHandler.swift::handle_event")
			let event = Event(pointer: eventPointer.pointee).dangle().clone();

			return instance.handle_event(event: event)
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: EventHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "EventHandler.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKEventHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_event: handle_eventCallback,
			free: freeCallback)

    }

    public init(pointer: LDKEventHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKEventHandler, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> EventHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing EventHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing EventHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func handle_event(event: Event) -> Void {
    	/* EDIT ME */
		Bindings.print("EventHandler::handle_event should be overridden!", severity: .WARNING)


    }

    open func free() -> Void {
    	/* EDIT ME */
		Bindings.print("EventHandler::free should be overridden!", severity: .WARNING)


    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedEventHandler: EventHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_event(event: Event) -> Void {
		
				
				withUnsafePointer(to: event.cOpaqueStruct!) { (eventPointer: UnsafePointer<LDKEvent>) in

				self.cOpaqueStruct!.handle_event(self.cOpaqueStruct!.this_arg, eventPointer)
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

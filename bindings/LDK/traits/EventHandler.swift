open class EventHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public var cOpaqueStruct: LDKEventHandler?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_eventCallback(pointer: UnsafeRawPointer?, event: LDKEvent) -> Void {
			let instance: EventHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "EventHandler.swift::handle_event")
			
			return instance.handle_event(event: Event(pointer: event))
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
							print("Freeing EventHandler \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing EventHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func handle_event(event: Event) -> Void {
    	/* EDIT ME */
		
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedEventHandler: EventHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_event(event: Event) -> Void {
		
				
				
				self.cOpaqueStruct!.handle_event(self.cOpaqueStruct!.this_arg, event.danglingClone().cOpaqueStruct!)
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

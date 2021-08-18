open class EventHandler {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKEventHandler?;

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_eventCallback(pointer: UnsafeRawPointer?, event: LDKEvent) -> Void {
			let instance: EventHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "EventHandler.swift::handle_event")
			
			return instance.handle_event(event: Event(pointer: event));
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: EventHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "EventHandler.swift::free")
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKEventHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_event: handle_eventCallback,
			free: freeCallback)
    }

    public init(pointer: LDKEventHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */


				internal func free() -> Void {
					
					
					EventHandler_free(self.cOpaqueStruct!)
					
				}
			

					internal func dangle() -> EventHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    open func handle_event(event: Event) -> Void {
    	/* EDIT ME */
		
    }



    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedEventHandler: EventHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_event(event: Event) -> Void {
		
				
				self.cOpaqueStruct!.handle_event(self.cOpaqueStruct!.this_arg, event.clone().cOpaqueStruct!)
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}

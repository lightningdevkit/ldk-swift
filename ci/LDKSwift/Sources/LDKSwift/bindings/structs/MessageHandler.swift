#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class MessageHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMessageHandler?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chan_handler_arg: ChannelMessageHandler, route_handler_arg: RoutingMessageHandler) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = MessageHandler_new(chan_handler_arg.activate().cOpaqueStruct!, route_handler_arg.activate().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        try? self.addAnchor(anchor: chan_handler_arg)
try? self.addAnchor(anchor: route_handler_arg)

    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKMessageHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMessageHandler, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_chan_handler() -> NativelyImplementedChannelMessageHandler {
    	
        return NativelyImplementedChannelMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMessageHandler>) in
MessageHandler_get_chan_handler(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_chan_handler(val: ChannelMessageHandler) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKMessageHandler>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return MessageHandler_set_chan_handler(this_ptrPointer, val.activate().cOpaqueStruct!);
    }

    public func get_route_handler() -> NativelyImplementedRoutingMessageHandler {
    	
        return NativelyImplementedRoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMessageHandler>) in
MessageHandler_get_route_handler(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_route_handler(val: RoutingMessageHandler) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKMessageHandler>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return MessageHandler_set_route_handler(this_ptrPointer, val.activate().cOpaqueStruct!);
    }

    internal func free() -> Void {
    	
        return MessageHandler_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing MessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

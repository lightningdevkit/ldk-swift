import LDKHeaders

public class IgnoringMessageHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKIgnoringMessageHandler?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = IgnoringMessageHandler_new()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKIgnoringMessageHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return NativelyImplementedMessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
}, anchor: self);
    }

    public func as_RoutingMessageHandler() -> RoutingMessageHandler {
    	
        return NativelyImplementedRoutingMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKIgnoringMessageHandler>) in
IgnoringMessageHandler_as_RoutingMessageHandler(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return IgnoringMessageHandler_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> IgnoringMessageHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing IgnoringMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing IgnoringMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

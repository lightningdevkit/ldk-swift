import LDKHeaders

public class ErroringMessageHandler: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKErroringMessageHandler?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ErroringMessageHandler_new()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErroringMessageHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func as_MessageSendEventsProvider() -> MessageSendEventsProvider {
    	
        return NativelyImplementedMessageSendEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_MessageSendEventsProvider(this_argPointer)
}, anchor: self);
    }

    public func as_ChannelMessageHandler() -> ChannelMessageHandler {
    	
        return NativelyImplementedChannelMessageHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKErroringMessageHandler>) in
ErroringMessageHandler_as_ChannelMessageHandler(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return ErroringMessageHandler_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ErroringMessageHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ErroringMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ErroringMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

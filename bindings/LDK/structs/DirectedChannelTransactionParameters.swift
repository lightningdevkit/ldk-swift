public class DirectedChannelTransactionParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKDirectedChannelTransactionParameters?


	

    public init(pointer: LDKDirectedChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func broadcaster_pubkeys() -> ChannelPublicKeys {
    	
        return ChannelPublicKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_broadcaster_pubkeys(this_argPointer)
});
    }

    public func countersignatory_pubkeys() -> ChannelPublicKeys {
    	
        return ChannelPublicKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_countersignatory_pubkeys(this_argPointer)
});
    }

    public func contest_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_contest_delay(this_argPointer)
};
    }

    public func is_outbound() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_is_outbound(this_argPointer)
};
    }

    public func funding_outpoint() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_funding_outpoint(this_argPointer)
});
    }

    internal func free() -> Void {
    	
        return DirectedChannelTransactionParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DirectedChannelTransactionParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing DirectedChannelTransactionParameters \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing DirectedChannelTransactionParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

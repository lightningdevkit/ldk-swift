#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class DirectedChannelTransactionParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKDirectedChannelTransactionParameters?


	

    public init(pointer: LDKDirectedChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKDirectedChannelTransactionParameters, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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

    public func funding_outpoint() -> OutPoint? {
    	
        return 
				{ () in
					let cStruct =
				withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_funding_outpoint(this_argPointer)
};
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct)
				}()
			;
    }

    public func opt_anchors() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_opt_anchors(this_argPointer)
};
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
							Bindings.print("Freeing DirectedChannelTransactionParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DirectedChannelTransactionParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

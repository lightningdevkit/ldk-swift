public class DirectedChannelTransactionParameters {

    var cOpaqueStruct: LDKDirectedChannelTransactionParameters?;

	

    public init(pointer: LDKDirectedChannelTransactionParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func broadcaster_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	/* NATIVE_CALL_PREP */
        return ChannelPublicKeys(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_broadcaster_pubkeys(this_argPointer)
});
    }

    public func countersignatory_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	/* NATIVE_CALL_PREP */
        return ChannelPublicKeys(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_countersignatory_pubkeys(this_argPointer)
});
    }

    public func contest_delay(this_arg: DirectedChannelTransactionParameters) -> UInt16 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_contest_delay(this_argPointer)
};
    }

    public func is_outbound(this_arg: DirectedChannelTransactionParameters) -> Bool {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_is_outbound(this_argPointer)
};
    }

    public func funding_outpoint(this_arg: DirectedChannelTransactionParameters) -> OutPoint {
    	/* NATIVE_CALL_PREP */
        return OutPoint(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
DirectedChannelTransactionParameters_funding_outpoint(this_argPointer)
});
    }

				
	deinit {
					
					
		DirectedChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

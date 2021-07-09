public class DirectedChannelTransactionParameters {

    public internal(set) var cOpaqueStruct: LDKDirectedChannelTransactionParameters?;

	

    public init(pointer: LDKDirectedChannelTransactionParameters){
		self.cOpaqueStruct = pointer
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

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		DirectedChannelTransactionParameters_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

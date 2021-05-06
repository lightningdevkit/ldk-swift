public class DirectedChannelTransactionParameters {

    var cOpaqueStruct: LDKDirectedChannelTransactionParameters?;

	

    public init(pointer: LDKDirectedChannelTransactionParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func broadcaster_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: DirectedChannelTransactionParameters_broadcaster_pubkeys(this_argPointer));
    }

    public func countersignatory_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: DirectedChannelTransactionParameters_countersignatory_pubkeys(this_argPointer));
    }

    public func contest_delay(this_arg: DirectedChannelTransactionParameters) -> UInt16 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_contest_delay(this_argPointer);
    }

    public func is_outbound(this_arg: DirectedChannelTransactionParameters) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_is_outbound(this_argPointer);
    }

    public func funding_outpoint(this_arg: DirectedChannelTransactionParameters) -> OutPoint {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: DirectedChannelTransactionParameters_funding_outpoint(this_argPointer));
    }

				
	deinit {
					
					
		DirectedChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

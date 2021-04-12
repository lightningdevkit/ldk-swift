class DirectedChannelTransactionParameters {

    var cOpaqueStruct: LDKDirectedChannelTransactionParameters?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKDirectedChannelTransactionParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func broadcaster_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_broadcaster_pubkeys(this_argPointer);
    }

    func countersignatory_pubkeys(this_arg: DirectedChannelTransactionParameters) -> ChannelPublicKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_countersignatory_pubkeys(this_argPointer);
    }

    func contest_delay(this_arg: DirectedChannelTransactionParameters) -> U {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_contest_delay(this_argPointer);
    }

    func is_outbound(this_arg: DirectedChannelTransactionParameters) -> boolean {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_is_outbound(this_argPointer);
    }

    func funding_outpoint(this_arg: DirectedChannelTransactionParameters) -> OutPoint {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters_funding_outpoint(this_argPointer);
    }

				
	deinit {
					
					
		DirectedChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class ChannelTransactionParameters {

    var cOpaqueStruct: LDKChannelTransactionParameters?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(holder_pubkeys_arg: ChannelPublicKeys, holder_selected_contest_delay_arg: UInt16, is_outbound_from_holder_arg: Bool, counterparty_parameters_arg: CounterpartyChannelTransactionParameters, funding_outpoint_arg: OutPoint) {
    	
        self.cOpaqueStruct = ChannelTransactionParameters_new(holder_pubkeys_arg.cOpaqueStruct!, holder_selected_contest_delay_arg, is_outbound_from_holder_arg, counterparty_parameters_arg.cOpaqueStruct!, funding_outpoint_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelTransactionParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_holder_pubkeys() -> ChannelPublicKeys {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: ChannelTransactionParameters_get_holder_pubkeys(this_ptrPointer));
    }

    func set_holder_pubkeys(val: ChannelPublicKeys) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_set_holder_pubkeys(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_holder_selected_contest_delay() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_get_holder_selected_contest_delay(this_ptrPointer);
    }

    func set_holder_selected_contest_delay(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_set_holder_selected_contest_delay(this_ptrPointer, val);
    }

    func get_is_outbound_from_holder() -> Bool {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_get_is_outbound_from_holder(this_ptrPointer);
    }

    func set_is_outbound_from_holder(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_set_is_outbound_from_holder(this_ptrPointer, val);
    }

    func get_counterparty_parameters() -> CounterpartyChannelTransactionParameters {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters(pointer: ChannelTransactionParameters_get_counterparty_parameters(this_ptrPointer));
    }

    func set_counterparty_parameters(val: CounterpartyChannelTransactionParameters) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_set_counterparty_parameters(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_funding_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: ChannelTransactionParameters_get_funding_outpoint(this_ptrPointer));
    }

    func set_funding_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_set_funding_outpoint(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: ChannelTransactionParameters) -> ChannelTransactionParameters {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters(pointer: ChannelTransactionParameters_clone(origPointer));
    }

    func is_populated(this_arg: ChannelTransactionParameters) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters_is_populated(this_argPointer);
    }

    func as_holder_broadcastable(this_arg: ChannelTransactionParameters) -> DirectedChannelTransactionParameters {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters(pointer: ChannelTransactionParameters_as_holder_broadcastable(this_argPointer));
    }

    func as_counterparty_broadcastable(this_arg: ChannelTransactionParameters) -> DirectedChannelTransactionParameters {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return DirectedChannelTransactionParameters(pointer: ChannelTransactionParameters_as_counterparty_broadcastable(this_argPointer));
    }

    func write(obj: ChannelTransactionParameters) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelTransactionParameters_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelTransactionParametersDecodeErrorZ {
    	
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: ChannelTransactionParameters_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

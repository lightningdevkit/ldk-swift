class InMemorySigner {

    var cOpaqueStruct: LDKInMemorySigner?;

    init(funding_key: [U], revocation_base_key: [U], payment_key: [U], delayed_payment_base_key: [U], htlc_base_key: [U], commitment_seed: [U], channel_value_satoshis: U, channel_keys_id: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = InMemorySigner_new(funding_key, revocation_base_key, payment_key, delayed_payment_base_key, htlc_base_key, commitment_seed, channel_value_satoshis, channel_keys_id)
    }

    private init(pointer: LDKInMemorySigner){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_funding_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_funding_key(this_ptrPointer);
    }

    func set_funding_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_funding_key(this_ptrPointer, val);
    }

    func get_revocation_base_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_revocation_base_key(this_ptrPointer);
    }

    func set_revocation_base_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_revocation_base_key(this_ptrPointer, val);
    }

    func get_payment_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_payment_key(this_ptrPointer);
    }

    func set_payment_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_payment_key(this_ptrPointer, val);
    }

    func get_delayed_payment_base_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_delayed_payment_base_key(this_ptrPointer);
    }

    func set_delayed_payment_base_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_delayed_payment_base_key(this_ptrPointer, val);
    }

    func get_htlc_base_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_htlc_base_key(this_ptrPointer);
    }

    func set_htlc_base_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_htlc_base_key(this_ptrPointer, val);
    }

    func get_commitment_seed() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_commitment_seed(this_ptrPointer);
    }

    func set_commitment_seed(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_commitment_seed(this_ptrPointer, val);
    }

    func clone(orig: InMemorySigner) -> InMemorySigner {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner(pointer: InMemorySigner_clone(origPointer));
    }

    func counterparty_pubkeys(this_arg: InMemorySigner) -> ChannelPublicKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_counterparty_pubkeys(this_argPointer);
    }

    func counterparty_selected_contest_delay(this_arg: InMemorySigner) -> U {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_counterparty_selected_contest_delay(this_argPointer);
    }

    func holder_selected_contest_delay(this_arg: InMemorySigner) -> U {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_holder_selected_contest_delay(this_argPointer);
    }

    func is_outbound(this_arg: InMemorySigner) -> boolean {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_is_outbound(this_argPointer);
    }

    func funding_outpoint(this_arg: InMemorySigner) -> OutPoint {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_funding_outpoint(this_argPointer);
    }

    func get_channel_parameters(this_arg: InMemorySigner) -> ChannelTransactionParameters {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_channel_parameters(this_argPointer);
    }

    func sign_counterparty_payment_input(this_arg: InMemorySigner, spend_tx: [U], input_idx: U, descriptor: StaticPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
						
		let descriptorPointer = withUnsafePointer(to: descriptor.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return InMemorySigner_sign_counterparty_payment_input(this_argPointer, spend_tx, input_idx, descriptorPointer);
    }

    func sign_dynamic_p2wsh_input(this_arg: InMemorySigner, spend_tx: [U], input_idx: U, descriptor: DelayedPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
						
		let descriptorPointer = withUnsafePointer(to: descriptor.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return InMemorySigner_sign_dynamic_p2wsh_input(this_argPointer, spend_tx, input_idx, descriptorPointer);
    }

    func as_Sign(this_arg: InMemorySigner) -> Sign {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_as_Sign(this_argPointer);
    }

    func write(obj: InMemorySigner) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_write(objPointer);
    }

    func read(ser: [U]) -> Result_InMemorySignerDecodeErrorZ {
    	
        return InMemorySigner_read(ser);
    }

				
	deinit {
					
					
		InMemorySigner_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class InMemorySigner {

    var cOpaqueStruct: LDKInMemorySigner?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(funding_key: [UInt8], revocation_base_key: [UInt8], payment_key: [UInt8], delayed_payment_base_key: [UInt8], htlc_base_key: [UInt8], commitment_seed: [UInt8], channel_value_satoshis: UInt64, channel_keys_id: [UInt8]) {
    	
		let converted_funding_key = Bindings.new_LDKSecretKey(array: funding_key)
		let converted_revocation_base_key = Bindings.new_LDKSecretKey(array: revocation_base_key)
		let converted_payment_key = Bindings.new_LDKSecretKey(array: payment_key)
		let converted_delayed_payment_base_key = Bindings.new_LDKSecretKey(array: delayed_payment_base_key)
		let converted_htlc_base_key = Bindings.new_LDKSecretKey(array: htlc_base_key)
		let converted_commitment_seed = Bindings.new_LDKThirtyTwoBytes(array: commitment_seed)
		let converted_channel_keys_id = Bindings.new_LDKThirtyTwoBytes(array: channel_keys_id)
        self.cOpaqueStruct = InMemorySigner_new(converted_funding_key, converted_revocation_base_key, converted_payment_key, converted_delayed_payment_base_key, converted_htlc_base_key, converted_commitment_seed, channel_value_satoshis, converted_channel_keys_id)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKInMemorySigner){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_funding_key() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_funding_key(this_ptrPointer).pointee;
    }

    func set_funding_key(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_funding_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    func get_revocation_base_key() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_revocation_base_key(this_ptrPointer).pointee;
    }

    func set_revocation_base_key(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_revocation_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    func get_payment_key() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_payment_key(this_ptrPointer).pointee;
    }

    func set_payment_key(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_payment_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    func get_delayed_payment_base_key() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_delayed_payment_base_key(this_ptrPointer).pointee;
    }

    func set_delayed_payment_base_key(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_delayed_payment_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    func get_htlc_base_key() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_htlc_base_key(this_ptrPointer).pointee;
    }

    func set_htlc_base_key(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_htlc_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    func get_commitment_seed() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_get_commitment_seed(this_ptrPointer).pointee;
    }

    func set_commitment_seed(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_set_commitment_seed(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
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
					
        return ChannelPublicKeys(pointer: InMemorySigner_counterparty_pubkeys(this_argPointer));
    }

    func counterparty_selected_contest_delay(this_arg: InMemorySigner) -> UInt16 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_counterparty_selected_contest_delay(this_argPointer);
    }

    func holder_selected_contest_delay(this_arg: InMemorySigner) -> UInt16 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_holder_selected_contest_delay(this_argPointer);
    }

    func is_outbound(this_arg: InMemorySigner) -> Bool {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return InMemorySigner_is_outbound(this_argPointer);
    }

    func funding_outpoint(this_arg: InMemorySigner) -> OutPoint {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: InMemorySigner_funding_outpoint(this_argPointer));
    }

    func get_channel_parameters(this_arg: InMemorySigner) -> ChannelTransactionParameters {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return ChannelTransactionParameters(pointer: InMemorySigner_get_channel_parameters(this_argPointer));
    }

    func sign_counterparty_payment_input(this_arg: InMemorySigner, spend_tx: [UInt8], input_idx: UInt, descriptor: StaticPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
						
		let descriptorPointer = withUnsafePointer(to: descriptor.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return Result_CVec_CVec_u8ZZNoneZ(pointer: InMemorySigner_sign_counterparty_payment_input(this_argPointer, Bindings.new_LDKTransaction(array: spend_tx), input_idx, descriptorPointer));
    }

    func sign_dynamic_p2wsh_input(this_arg: InMemorySigner, spend_tx: [UInt8], input_idx: UInt, descriptor: DelayedPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
						
		let descriptorPointer = withUnsafePointer(to: descriptor.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return Result_CVec_CVec_u8ZZNoneZ(pointer: InMemorySigner_sign_dynamic_p2wsh_input(this_argPointer, Bindings.new_LDKTransaction(array: spend_tx), input_idx, descriptorPointer));
    }

    func as_BaseSign(this_arg: InMemorySigner) -> BaseSign {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return BaseSign(pointer: InMemorySigner_as_BaseSign(this_argPointer));
    }

    func as_Sign(this_arg: InMemorySigner) -> Sign {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return Sign(pointer: InMemorySigner_as_Sign(this_argPointer));
    }

    func write(obj: InMemorySigner) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInMemorySigner>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: InMemorySigner_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: InMemorySigner_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		InMemorySigner_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class DelayedPaymentOutputDescriptor {

    var cOpaqueStruct: LDKDelayedPaymentOutputDescriptor?;

    init(outpoint_arg: OutPoint, per_commitment_point_arg: [U], to_self_delay_arg: U, output_arg: TxOut, revocation_pubkey_arg: [U], channel_keys_id_arg: [U], channel_value_satoshis_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = DelayedPaymentOutputDescriptor_new(outpoint_arg, per_commitment_point_arg, to_self_delay_arg, output_arg, revocation_pubkey_arg, channel_keys_id_arg, channel_value_satoshis_arg)
    }

    private init(pointer: LDKDelayedPaymentOutputDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_outpoint(this_ptrPointer);
    }

    func set_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_outpoint(this_ptrPointer, val);
    }

    func get_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_per_commitment_point(this_ptrPointer);
    }

    func set_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_per_commitment_point(this_ptrPointer, val);
    }

    func get_to_self_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_to_self_delay(this_ptrPointer);
    }

    func set_to_self_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_to_self_delay(this_ptrPointer, val);
    }

    func set_output(val: TxOut) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_output(this_ptrPointer, val);
    }

    func get_revocation_pubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_revocation_pubkey(this_ptrPointer);
    }

    func set_revocation_pubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_revocation_pubkey(this_ptrPointer, val);
    }

    func get_channel_keys_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_channel_keys_id(this_ptrPointer);
    }

    func set_channel_keys_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_channel_keys_id(this_ptrPointer, val);
    }

    func get_channel_value_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_channel_value_satoshis(this_ptrPointer);
    }

    func set_channel_value_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_channel_value_satoshis(this_ptrPointer, val);
    }

    func clone(orig: DelayedPaymentOutputDescriptor) -> DelayedPaymentOutputDescriptor {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor(pointer: DelayedPaymentOutputDescriptor_clone(origPointer));
    }

				
	deinit {
					
					
		DelayedPaymentOutputDescriptor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

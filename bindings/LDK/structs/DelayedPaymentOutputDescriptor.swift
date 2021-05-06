public class DelayedPaymentOutputDescriptor {

    var cOpaqueStruct: LDKDelayedPaymentOutputDescriptor?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(outpoint_arg: OutPoint, per_commitment_point_arg: [UInt8], to_self_delay_arg: UInt16, output_arg: LDKTxOut, revocation_pubkey_arg: [UInt8], channel_keys_id_arg: [UInt8], channel_value_satoshis_arg: UInt64) {
    	
		let converted_per_commitment_point_arg = Bindings.new_LDKPublicKey(array: per_commitment_point_arg)
		let converted_revocation_pubkey_arg = Bindings.new_LDKPublicKey(array: revocation_pubkey_arg)
		let converted_channel_keys_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_keys_id_arg)
        self.cOpaqueStruct = DelayedPaymentOutputDescriptor_new(outpoint_arg.cOpaqueStruct!, converted_per_commitment_point_arg, to_self_delay_arg, output_arg, converted_revocation_pubkey_arg, converted_channel_keys_id_arg, channel_value_satoshis_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKDelayedPaymentOutputDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: DelayedPaymentOutputDescriptor_get_outpoint(this_ptrPointer));
    }

    public func set_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_outpoint(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_per_commitment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: DelayedPaymentOutputDescriptor_get_per_commitment_point(this_ptrPointer));
    }

    public func set_per_commitment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_to_self_delay() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_to_self_delay(this_ptrPointer);
    }

    public func set_to_self_delay(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_to_self_delay(this_ptrPointer, val);
    }

    public func set_output(val: LDKTxOut) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_output(this_ptrPointer, val);
    }

    public func get_revocation_pubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: DelayedPaymentOutputDescriptor_get_revocation_pubkey(this_ptrPointer));
    }

    public func set_revocation_pubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_revocation_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_channel_keys_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_channel_keys_id(this_ptrPointer).pointee;
    }

    public func set_channel_keys_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_channel_keys_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_channel_value_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_get_channel_value_satoshis(this_ptrPointer);
    }

    public func set_channel_value_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDelayedPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return DelayedPaymentOutputDescriptor_set_channel_value_satoshis(this_ptrPointer, val);
    }

    public func clone(orig: DelayedPaymentOutputDescriptor) -> DelayedPaymentOutputDescriptor {
    	
						
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

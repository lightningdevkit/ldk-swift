class TxCreationKeys {

    var cOpaqueStruct: LDKTxCreationKeys?;

    init(per_commitment_point_arg: [U], revocation_key_arg: [U], broadcaster_htlc_key_arg: [U], countersignatory_htlc_key_arg: [U], broadcaster_delayed_payment_key_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = TxCreationKeys_new(per_commitment_point_arg, revocation_key_arg, broadcaster_htlc_key_arg, countersignatory_htlc_key_arg, broadcaster_delayed_payment_key_arg)
    }

    private init(pointer: LDKTxCreationKeys){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_get_per_commitment_point(this_ptrPointer);
    }

    func set_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_set_per_commitment_point(this_ptrPointer, val);
    }

    func get_revocation_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_get_revocation_key(this_ptrPointer);
    }

    func set_revocation_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_set_revocation_key(this_ptrPointer, val);
    }

    func get_broadcaster_htlc_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_get_broadcaster_htlc_key(this_ptrPointer);
    }

    func set_broadcaster_htlc_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_set_broadcaster_htlc_key(this_ptrPointer, val);
    }

    func get_countersignatory_htlc_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_get_countersignatory_htlc_key(this_ptrPointer);
    }

    func set_countersignatory_htlc_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_set_countersignatory_htlc_key(this_ptrPointer, val);
    }

    func get_broadcaster_delayed_payment_key() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_get_broadcaster_delayed_payment_key(this_ptrPointer);
    }

    func set_broadcaster_delayed_payment_key(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_set_broadcaster_delayed_payment_key(this_ptrPointer, val);
    }

    func clone(orig: TxCreationKeys) -> TxCreationKeys {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys(pointer: TxCreationKeys_clone(origPointer));
    }

    func write(obj: TxCreationKeys) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTxCreationKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_write(objPointer);
    }

    func read(ser: [U]) -> Result_TxCreationKeysDecodeErrorZ {
    	
        return TxCreationKeys_read(ser);
    }

    func derive_new(per_commitment_point: [U], broadcaster_delayed_payment_base: [U], broadcaster_htlc_base: [U], countersignatory_revocation_base: [U], countersignatory_htlc_base: [U]) -> Result_TxCreationKeysErrorZ {
    	
        return TxCreationKeys_derive_new(per_commitment_point, broadcaster_delayed_payment_base, broadcaster_htlc_base, countersignatory_revocation_base, countersignatory_htlc_base);
    }

    func from_channel_static_keys(per_commitment_point: [U], broadcaster_keys: ChannelPublicKeys, countersignatory_keys: ChannelPublicKeys) -> Result_TxCreationKeysErrorZ {
    	
						
		let broadcaster_keysPointer = withUnsafePointer(to: broadcaster_keys.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
						
		let countersignatory_keysPointer = withUnsafePointer(to: countersignatory_keys.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return TxCreationKeys_from_channel_static_keys(per_commitment_point, broadcaster_keysPointer, countersignatory_keysPointer);
    }

				
	deinit {
					
					
		TxCreationKeys_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

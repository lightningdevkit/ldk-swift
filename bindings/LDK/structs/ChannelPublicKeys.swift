class ChannelPublicKeys {

    var cOpaqueStruct: LDKChannelPublicKeys?;

    init(funding_pubkey_arg: [U], revocation_basepoint_arg: [U], payment_point_arg: [U], delayed_payment_basepoint_arg: [U], htlc_basepoint_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelPublicKeys_new(funding_pubkey_arg, revocation_basepoint_arg, payment_point_arg, delayed_payment_basepoint_arg, htlc_basepoint_arg)
    }

    private init(pointer: LDKChannelPublicKeys){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_funding_pubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_get_funding_pubkey(this_ptrPointer);
    }

    func set_funding_pubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_funding_pubkey(this_ptrPointer, val);
    }

    func get_revocation_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_get_revocation_basepoint(this_ptrPointer);
    }

    func set_revocation_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_revocation_basepoint(this_ptrPointer, val);
    }

    func get_payment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_get_payment_point(this_ptrPointer);
    }

    func set_payment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_payment_point(this_ptrPointer, val);
    }

    func get_delayed_payment_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_get_delayed_payment_basepoint(this_ptrPointer);
    }

    func set_delayed_payment_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_delayed_payment_basepoint(this_ptrPointer, val);
    }

    func get_htlc_basepoint() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_get_htlc_basepoint(this_ptrPointer);
    }

    func set_htlc_basepoint(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_htlc_basepoint(this_ptrPointer, val);
    }

    func clone(orig: ChannelPublicKeys) -> ChannelPublicKeys {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: ChannelPublicKeys_clone(origPointer));
    }

    func write(obj: ChannelPublicKeys) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return ChannelPublicKeys_read(ser);
    }

				
	deinit {
					
					
		ChannelPublicKeys_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

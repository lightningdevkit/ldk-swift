public class ChannelPublicKeys {

    var cOpaqueStruct: LDKChannelPublicKeys?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(funding_pubkey_arg: [UInt8], revocation_basepoint_arg: [UInt8], payment_point_arg: [UInt8], delayed_payment_basepoint_arg: [UInt8], htlc_basepoint_arg: [UInt8]) {
    	
		let converted_funding_pubkey_arg = Bindings.new_LDKPublicKey(array: funding_pubkey_arg)
		let converted_revocation_basepoint_arg = Bindings.new_LDKPublicKey(array: revocation_basepoint_arg)
		let converted_payment_point_arg = Bindings.new_LDKPublicKey(array: payment_point_arg)
		let converted_delayed_payment_basepoint_arg = Bindings.new_LDKPublicKey(array: delayed_payment_basepoint_arg)
		let converted_htlc_basepoint_arg = Bindings.new_LDKPublicKey(array: htlc_basepoint_arg)
        self.cOpaqueStruct = ChannelPublicKeys_new(converted_funding_pubkey_arg, converted_revocation_basepoint_arg, converted_payment_point_arg, converted_delayed_payment_basepoint_arg, converted_htlc_basepoint_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelPublicKeys){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_funding_pubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelPublicKeys_get_funding_pubkey(this_ptrPointer));
    }

    public func set_funding_pubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_funding_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_revocation_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelPublicKeys_get_revocation_basepoint(this_ptrPointer));
    }

    public func set_revocation_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_revocation_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_payment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelPublicKeys_get_payment_point(this_ptrPointer));
    }

    public func set_payment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_payment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_delayed_payment_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelPublicKeys_get_delayed_payment_basepoint(this_ptrPointer));
    }

    public func set_delayed_payment_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_delayed_payment_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_htlc_basepoint() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: ChannelPublicKeys_get_htlc_basepoint(this_ptrPointer));
    }

    public func set_htlc_basepoint(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys_set_htlc_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone(orig: ChannelPublicKeys) -> ChannelPublicKeys {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: ChannelPublicKeys_clone(origPointer));
    }

    public func write(obj: ChannelPublicKeys) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelPublicKeys_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return Result_ChannelPublicKeysDecodeErrorZ(pointer: ChannelPublicKeys_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelPublicKeys_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

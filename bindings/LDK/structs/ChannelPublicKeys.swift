public class ChannelPublicKeys {

    var cOpaqueStruct: LDKChannelPublicKeys?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(funding_pubkey_arg: [UInt8], revocation_basepoint_arg: [UInt8], payment_point_arg: [UInt8], delayed_payment_basepoint_arg: [UInt8], htlc_basepoint_arg: [UInt8]) {
    	
        self.cOpaqueStruct = ChannelPublicKeys_new(Bindings.new_LDKPublicKey(array: funding_pubkey_arg), Bindings.new_LDKPublicKey(array: revocation_basepoint_arg), Bindings.new_LDKPublicKey(array: payment_point_arg), Bindings.new_LDKPublicKey(array: delayed_payment_basepoint_arg), Bindings.new_LDKPublicKey(array: htlc_basepoint_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelPublicKeys){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_funding_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_get_funding_pubkey(this_ptrPointer)
});
    }

    public func set_funding_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelPublicKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelPublicKeys_set_funding_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_revocation_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_get_revocation_basepoint(this_ptrPointer)
});
    }

    public func set_revocation_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelPublicKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelPublicKeys_set_revocation_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_payment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_get_payment_point(this_ptrPointer)
});
    }

    public func set_payment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelPublicKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelPublicKeys_set_payment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_delayed_payment_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_get_delayed_payment_basepoint(this_ptrPointer)
});
    }

    public func set_delayed_payment_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelPublicKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelPublicKeys_set_delayed_payment_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_htlc_basepoint() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_get_htlc_basepoint(this_ptrPointer)
});
    }

    public func set_htlc_basepoint(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelPublicKeys>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelPublicKeys_set_htlc_basepoint(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone(orig: ChannelPublicKeys) -> ChannelPublicKeys {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys(pointer: ChannelPublicKeys_clone(origPointer))
};
    }

    public func write(obj: ChannelPublicKeys) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelPublicKeys>) in
ChannelPublicKeys_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelPublicKeysDecodeErrorZ {
    	
        return Result_ChannelPublicKeysDecodeErrorZ(pointer: ChannelPublicKeys_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelPublicKeys_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

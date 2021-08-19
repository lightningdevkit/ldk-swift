import LDKHeaders

public class InMemorySigner {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKInMemorySigner?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(funding_key: [UInt8], revocation_base_key: [UInt8], payment_key: [UInt8], delayed_payment_base_key: [UInt8], htlc_base_key: [UInt8], commitment_seed: [UInt8], channel_value_satoshis: UInt64, channel_keys_id: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = InMemorySigner_new(Bindings.new_LDKSecretKey(array: funding_key), Bindings.new_LDKSecretKey(array: revocation_base_key), Bindings.new_LDKSecretKey(array: payment_key), Bindings.new_LDKSecretKey(array: delayed_payment_base_key), Bindings.new_LDKSecretKey(array: htlc_base_key), Bindings.new_LDKThirtyTwoBytes(array: commitment_seed), channel_value_satoshis, Bindings.new_LDKThirtyTwoBytes(array: channel_keys_id))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInMemorySigner){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_funding_key() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_funding_key(this_ptrPointer)
}.pointee);
    }

    public func set_funding_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_funding_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    public func get_revocation_base_key() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_revocation_base_key(this_ptrPointer)
}.pointee);
    }

    public func set_revocation_base_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_revocation_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    public func get_payment_key() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_payment_key(this_ptrPointer)
}.pointee);
    }

    public func set_payment_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_payment_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    public func get_delayed_payment_base_key() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_delayed_payment_base_key(this_ptrPointer)
}.pointee);
    }

    public func set_delayed_payment_base_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_delayed_payment_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    public func get_htlc_base_key() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_htlc_base_key(this_ptrPointer)
}.pointee);
    }

    public func set_htlc_base_key(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_htlc_base_key(this_ptrPointer, Bindings.new_LDKSecretKey(array: val));
    }

    public func get_commitment_seed() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_commitment_seed(this_ptrPointer)
}.pointee);
    }

    public func set_commitment_seed(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInMemorySigner>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return InMemorySigner_set_commitment_seed(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func clone() -> InMemorySigner {
    	
        return InMemorySigner(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_clone(origPointer)
});
    }

					internal func danglingClone() -> InMemorySigner {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func counterparty_pubkeys() -> ChannelPublicKeys {
    	
        return ChannelPublicKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_counterparty_pubkeys(this_argPointer)
});
    }

    public func counterparty_selected_contest_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_counterparty_selected_contest_delay(this_argPointer)
};
    }

    public func holder_selected_contest_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_holder_selected_contest_delay(this_argPointer)
};
    }

    public func is_outbound() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_is_outbound(this_argPointer)
};
    }

    public func funding_outpoint() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_funding_outpoint(this_argPointer)
});
    }

    public func get_channel_parameters() -> ChannelTransactionParameters {
    	
        return ChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_get_channel_parameters(this_argPointer)
});
    }

    public func sign_counterparty_payment_input(spend_tx: [UInt8], input_idx: UInt, descriptor: StaticPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
        return Result_CVec_CVec_u8ZZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
withUnsafePointer(to: descriptor.cOpaqueStruct!) { (descriptorPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
InMemorySigner_sign_counterparty_payment_input(this_argPointer, Bindings.new_LDKTransactionWrapper(array: spend_tx).cOpaqueStruct!, input_idx, descriptorPointer)
}
});
    }

    public func sign_dynamic_p2wsh_input(spend_tx: [UInt8], input_idx: UInt, descriptor: DelayedPaymentOutputDescriptor) -> Result_CVec_CVec_u8ZZNoneZ {
    	
        return Result_CVec_CVec_u8ZZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
withUnsafePointer(to: descriptor.cOpaqueStruct!) { (descriptorPointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
InMemorySigner_sign_dynamic_p2wsh_input(this_argPointer, Bindings.new_LDKTransactionWrapper(array: spend_tx).cOpaqueStruct!, input_idx, descriptorPointer)
}
});
    }

    public func as_BaseSign() -> BaseSign {
    	
        return NativelyImplementedBaseSign(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_as_BaseSign(this_argPointer)
}, anchor: self);
    }

    public func as_Sign() -> Sign {
    	
        return NativelyImplementedSign(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_as_Sign(this_argPointer)
}, anchor: self);
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInMemorySigner>) in
InMemorySigner_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: InMemorySigner_read(Bindings.new_LDKu8sliceWrapper(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return InMemorySigner_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> InMemorySigner {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing InMemorySigner \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing InMemorySigner \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

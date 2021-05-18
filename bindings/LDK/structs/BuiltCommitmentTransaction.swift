public class BuiltCommitmentTransaction {

    var cOpaqueStruct: LDKBuiltCommitmentTransaction?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(transaction_arg: [UInt8], txid_arg: [UInt8]) {
    	
        self.cOpaqueStruct = BuiltCommitmentTransaction_new(Bindings.new_LDKTransaction(array: transaction_arg), Bindings.new_LDKThirtyTwoBytes(array: txid_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKBuiltCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_transaction() -> [UInt8] {
    	
        return Bindings.LDKTransaction_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_transaction(this_ptrPointer)
});
    }

    public func set_transaction(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKBuiltCommitmentTransaction>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return BuiltCommitmentTransaction_set_transaction(this_ptrPointer, Bindings.new_LDKTransaction(array: val));
    }

    public func get_txid() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_txid(this_ptrPointer)
}.pointee);
    }

    public func set_txid(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKBuiltCommitmentTransaction>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return BuiltCommitmentTransaction_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func clone(orig: BuiltCommitmentTransaction) -> BuiltCommitmentTransaction {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction(pointer: BuiltCommitmentTransaction_clone(origPointer))
};
    }

    public func write(obj: BuiltCommitmentTransaction) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: BuiltCommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func get_sighash_all(funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_sighash_all(this_argPointer, Bindings.new_LDKu8slice(array: funding_redeemscript), channel_value_satoshis)
});
    }

    public func sign(funding_key: [UInt8], funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: funding_key)) { (funding_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
BuiltCommitmentTransaction_sign(this_argPointer, funding_keyPointer, Bindings.new_LDKu8slice(array: funding_redeemscript), channel_value_satoshis)
}
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		BuiltCommitmentTransaction_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

class BuiltCommitmentTransaction {

    var cOpaqueStruct: LDKBuiltCommitmentTransaction?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(transaction_arg: [UInt8], txid_arg: [UInt8]) {
    	
		let converted_transaction_arg = Bindings.new_LDKTransaction(array: transaction_arg)
		let converted_txid_arg = Bindings.new_LDKThirtyTwoBytes(array: txid_arg)
        self.cOpaqueStruct = BuiltCommitmentTransaction_new(converted_transaction_arg, converted_txid_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKBuiltCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_transaction() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKTransaction_to_array(nativeType: BuiltCommitmentTransaction_get_transaction(this_ptrPointer));
    }

    func set_transaction(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_set_transaction(this_ptrPointer, Bindings.new_LDKTransaction(array: val));
    }

    func get_txid() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_get_txid(this_ptrPointer).pointee;
    }

    func set_txid(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func clone(orig: BuiltCommitmentTransaction) -> BuiltCommitmentTransaction {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction(pointer: BuiltCommitmentTransaction_clone(origPointer));
    }

    func write(obj: BuiltCommitmentTransaction) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: BuiltCommitmentTransaction_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: BuiltCommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

    func get_sighash_all(this_arg: BuiltCommitmentTransaction, funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: BuiltCommitmentTransaction_get_sighash_all(this_argPointer, Bindings.new_LDKu8slice(array: funding_redeemscript), channel_value_satoshis));
    }

    func sign(this_arg: BuiltCommitmentTransaction, funding_key: [UInt8], funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: BuiltCommitmentTransaction_sign(this_argPointer, Bindings.array_to_tuple32(array: funding_key), Bindings.new_LDKu8slice(array: funding_redeemscript), channel_value_satoshis));
    }

				
	deinit {
					
					
		BuiltCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

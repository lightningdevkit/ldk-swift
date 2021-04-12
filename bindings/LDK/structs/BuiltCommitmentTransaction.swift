class BuiltCommitmentTransaction {

    var cOpaqueStruct: LDKBuiltCommitmentTransaction?;

    init(transaction_arg: [U], txid_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = BuiltCommitmentTransaction_new(transaction_arg, txid_arg)
    }

    private init(pointer: LDKBuiltCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_transaction() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_get_transaction(this_ptrPointer);
    }

    func set_transaction(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_set_transaction(this_ptrPointer, val);
    }

    func get_txid() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_get_txid(this_ptrPointer);
    }

    func set_txid(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_set_txid(this_ptrPointer, val);
    }

    func clone(orig: BuiltCommitmentTransaction) -> BuiltCommitmentTransaction {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction(pointer: BuiltCommitmentTransaction_clone(origPointer));
    }

    func write(obj: BuiltCommitmentTransaction) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_write(objPointer);
    }

    func read(ser: [U]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
        return BuiltCommitmentTransaction_read(ser);
    }

    func get_sighash_all(this_arg: BuiltCommitmentTransaction, funding_redeemscript: [U], channel_value_satoshis: U) -> [U] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_get_sighash_all(this_argPointer, funding_redeemscript, channel_value_satoshis);
    }

    func sign(this_arg: BuiltCommitmentTransaction, funding_key: [U], funding_redeemscript: [U], channel_value_satoshis: U) -> [U] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction_sign(this_argPointer, funding_key, funding_redeemscript, channel_value_satoshis);
    }

				
	deinit {
					
					
		BuiltCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class TrustedCommitmentTransaction {

    var cOpaqueStruct: LDKTrustedCommitmentTransaction?;

	

    init(pointer: LDKTrustedCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func txid(this_arg: TrustedCommitmentTransaction) -> [UInt8] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: TrustedCommitmentTransaction_txid(this_argPointer));
    }

    func built_transaction(this_arg: TrustedCommitmentTransaction) -> BuiltCommitmentTransaction {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return BuiltCommitmentTransaction(pointer: TrustedCommitmentTransaction_built_transaction(this_argPointer));
    }

    func keys(this_arg: TrustedCommitmentTransaction) -> TxCreationKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return TxCreationKeys(pointer: TrustedCommitmentTransaction_keys(this_argPointer));
    }

    func get_htlc_sigs(this_arg: TrustedCommitmentTransaction, htlc_base_key: [UInt8], channel_parameters: DirectedChannelTransactionParameters) -> Result_CVec_SignatureZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
						
		let channel_parametersPointer = withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return Result_CVec_SignatureZNoneZ(pointer: TrustedCommitmentTransaction_get_htlc_sigs(this_argPointer, Bindings.array_to_tuple32(array: htlc_base_key), channel_parametersPointer));
    }

				
	deinit {
					
					
		TrustedCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

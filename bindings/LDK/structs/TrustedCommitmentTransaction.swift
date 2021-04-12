class TrustedCommitmentTransaction {

    var cOpaqueStruct: LDKTrustedCommitmentTransaction?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKTrustedCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func txid(this_arg: TrustedCommitmentTransaction) -> [U] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return TrustedCommitmentTransaction_txid(this_argPointer);
    }

    func built_transaction(this_arg: TrustedCommitmentTransaction) -> BuiltCommitmentTransaction {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return TrustedCommitmentTransaction_built_transaction(this_argPointer);
    }

    func keys(this_arg: TrustedCommitmentTransaction) -> TxCreationKeys {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
        return TrustedCommitmentTransaction_keys(this_argPointer);
    }

    func get_htlc_sigs(this_arg: TrustedCommitmentTransaction, htlc_base_key: [U], channel_parameters: DirectedChannelTransactionParameters) -> Result_CVec_SignatureZNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
							
			pointer
						
		}
					
						
		let channel_parametersPointer = withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return TrustedCommitmentTransaction_get_htlc_sigs(this_argPointer, htlc_base_key, channel_parametersPointer);
    }

				
	deinit {
					
					
		TrustedCommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

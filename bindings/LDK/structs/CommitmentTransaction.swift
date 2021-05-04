class CommitmentTransaction {

    var cOpaqueStruct: LDKCommitmentTransaction?;

	

    init(pointer: LDKCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: CommitmentTransaction) -> CommitmentTransaction {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return CommitmentTransaction(pointer: CommitmentTransaction_clone(origPointer));
    }

    func write(obj: CommitmentTransaction) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: CommitmentTransaction_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_CommitmentTransactionDecodeErrorZ {
    	
        return Result_CommitmentTransactionDecodeErrorZ(pointer: CommitmentTransaction_read(Bindings.new_LDKu8slice(array: ser)));
    }

    func commitment_number(this_arg: CommitmentTransaction) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return CommitmentTransaction_commitment_number(this_argPointer);
    }

    func to_broadcaster_value_sat(this_arg: CommitmentTransaction) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return CommitmentTransaction_to_broadcaster_value_sat(this_argPointer);
    }

    func to_countersignatory_value_sat(this_arg: CommitmentTransaction) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return CommitmentTransaction_to_countersignatory_value_sat(this_argPointer);
    }

    func feerate_per_kw(this_arg: CommitmentTransaction) -> UInt32 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return CommitmentTransaction_feerate_per_kw(this_argPointer);
    }

    func trust(this_arg: CommitmentTransaction) -> TrustedCommitmentTransaction {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
        return TrustedCommitmentTransaction(pointer: CommitmentTransaction_trust(this_argPointer));
    }

    func verify(this_arg: CommitmentTransaction, channel_parameters: DirectedChannelTransactionParameters, broadcaster_keys: ChannelPublicKeys, countersignatory_keys: ChannelPublicKeys) -> Result_TrustedCommitmentTransactionNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentTransaction>) in
							
			pointer
						
		}
					
						
		let channel_parametersPointer = withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
							
			pointer
						
		}
					
						
		let broadcaster_keysPointer = withUnsafePointer(to: broadcaster_keys.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
						
		let countersignatory_keysPointer = withUnsafePointer(to: countersignatory_keys.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelPublicKeys>) in
							
			pointer
						
		}
					
        return Result_TrustedCommitmentTransactionNoneZ(pointer: CommitmentTransaction_verify(this_argPointer, channel_parametersPointer, broadcaster_keysPointer, countersignatory_keysPointer));
    }

				
	deinit {
					
					
		CommitmentTransaction_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class KeysManager {

    var cOpaqueStruct: LDKKeysManager?;

    init(seed: [U], starting_time_secs: U, starting_time_nanos: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = KeysManager_new(seed, starting_time_secs, starting_time_nanos)
    }

    private init(pointer: LDKKeysManager){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func derive_channel_keys(this_arg: KeysManager, channel_value_satoshis: U, params: [U]) -> InMemorySigner {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
        return KeysManager_derive_channel_keys(this_argPointer, channel_value_satoshis, params);
    }

    func spend_spendable_outputs(this_arg: KeysManager, descriptors: [SpendableOutputDescriptor], outputs: [TxOut], change_destination_script: [U], feerate_sat_per_1000_weight: U) -> Result_TransactionNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
        return KeysManager_spend_spendable_outputs(this_argPointer, descriptors, outputs, change_destination_script, feerate_sat_per_1000_weight);
    }

    func as_KeysInterface(this_arg: KeysManager) -> KeysInterface {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
        return KeysManager_as_KeysInterface(this_argPointer);
    }

				
	deinit {
					
					
		KeysManager_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

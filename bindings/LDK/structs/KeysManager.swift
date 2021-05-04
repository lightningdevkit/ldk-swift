class KeysManager {

    var cOpaqueStruct: LDKKeysManager?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(seed: [UInt8], starting_time_secs: UInt64, starting_time_nanos: UInt32) {
    	
							
		let seedPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: seed)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        self.cOpaqueStruct = KeysManager_new(seedPointer, starting_time_secs, starting_time_nanos)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKKeysManager){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func derive_channel_keys(this_arg: KeysManager, channel_value_satoshis: UInt64, params: [UInt8]) -> InMemorySigner {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
							
		let paramsPointer = withUnsafePointer(to: Bindings.array_to_tuple32(array: params)) { (pointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
								
			pointer
							
		}
						
        return InMemorySigner(pointer: KeysManager_derive_channel_keys(this_argPointer, channel_value_satoshis, paramsPointer));
    }

    func spend_spendable_outputs(this_arg: KeysManager, descriptors: [LDKSpendableOutputDescriptor], outputs: [LDKTxOut], change_destination_script: [UInt8], feerate_sat_per_1000_weight: UInt32) -> Result_TransactionNoneZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
        return Result_TransactionNoneZ(pointer: KeysManager_spend_spendable_outputs(this_argPointer, Bindings.new_LDKCVec_SpendableOutputDescriptorZ(array: descriptors), Bindings.new_LDKCVec_TxOutZ(array: outputs), Bindings.new_LDKCVec_u8Z(array: change_destination_script), feerate_sat_per_1000_weight));
    }

    func as_KeysInterface(this_arg: KeysManager) -> KeysInterface {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysManager>) in
							
			pointer
						
		}
					
        return KeysInterface(pointer: KeysManager_as_KeysInterface(this_argPointer));
    }

				
	deinit {
					
					
		KeysManager_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

import LDKHeaders

public class KeysManager {

    public internal(set) var cOpaqueStruct: LDKKeysManager?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(seed: [UInt8], starting_time_secs: UInt64, starting_time_nanos: UInt32) {
    	
        self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: seed)) { (seedPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
KeysManager_new(seedPointer, starting_time_secs, starting_time_nanos)
}
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKKeysManager){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func derive_channel_keys(channel_value_satoshis: UInt64, params: [UInt8]) -> InMemorySigner {
    	
        return InMemorySigner(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: params)) { (paramsPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
KeysManager_derive_channel_keys(this_argPointer, channel_value_satoshis, paramsPointer)
}
});
    }

    public func spend_spendable_outputs(descriptors: [LDKSpendableOutputDescriptor], outputs: [LDKTxOut], change_destination_script: [UInt8], feerate_sat_per_1000_weight: UInt32) -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
KeysManager_spend_spendable_outputs(this_argPointer, Bindings.new_LDKCVec_SpendableOutputDescriptorZ(array: descriptors), Bindings.new_LDKCVec_TxOutZ(array: outputs), Bindings.new_LDKCVec_u8Z(array: change_destination_script), feerate_sat_per_1000_weight)
});
    }

    public func as_KeysInterface() -> KeysInterface {
    	
        return NativelyImplementedKeysInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
KeysManager_as_KeysInterface(this_argPointer)
});
    }

				
	deinit {
					
					
					
		KeysManager_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

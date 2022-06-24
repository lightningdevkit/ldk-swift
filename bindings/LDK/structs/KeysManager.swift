#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class KeysManager: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKKeysManager?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(seed: [UInt8], starting_time_secs: UInt64, starting_time_nanos: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: seed)) { (seedPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
KeysManager_new(seedPointer, starting_time_secs, starting_time_nanos)
}
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKKeysManager){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKKeysManager, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func derive_channel_keys(channel_value_satoshis: UInt64, params: [UInt8]) -> InMemorySigner {
    	
        return InMemorySigner(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: params)) { (paramsPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
KeysManager_derive_channel_keys(this_argPointer, channel_value_satoshis, paramsPointer)
}
});
    }

    public func spend_spendable_outputs(descriptors: [SpendableOutputDescriptor], outputs: [TxOut], change_destination_script: [UInt8], feerate_sat_per_1000_weight: UInt32) -> Result_TransactionNoneZ {
    	
							let descriptorsUnwrapped = descriptors.map { (descriptorsCurrentValue) in
							descriptorsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
							let outputsUnwrapped = outputs.map { (outputsCurrentValue) in
							outputsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.spend_spendable_outputs(descriptors: descriptorsUnwrapped, outputs: outputsUnwrapped, change_destination_script: change_destination_script, feerate_sat_per_1000_weight: feerate_sat_per_1000_weight);
    }

    internal func spend_spendable_outputs(descriptors: [LDKSpendableOutputDescriptor], outputs: [LDKTxOut], change_destination_script: [UInt8], feerate_sat_per_1000_weight: UInt32) -> Result_TransactionNoneZ {
    	
						let descriptorsWrapper = Bindings.new_LDKCVec_SpendableOutputDescriptorZWrapper(array: descriptors)
						defer {
							descriptorsWrapper.noOpRetain()
						}
					
						let outputsWrapper = Bindings.new_LDKCVec_TxOutZWrapper(array: outputs)
						defer {
							outputsWrapper.noOpRetain()
						}
					
						let change_destination_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: change_destination_script)
						defer {
							change_destination_scriptWrapper.noOpRetain()
						}
					
        return Result_TransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
KeysManager_spend_spendable_outputs(this_argPointer, descriptorsWrapper.dangle().cOpaqueStruct!, outputsWrapper.dangle().cOpaqueStruct!, change_destination_scriptWrapper.dangle().cOpaqueStruct!, feerate_sat_per_1000_weight)
});
    }

    public func as_KeysInterface() -> NativelyImplementedKeysInterface {
    	
        return NativelyImplementedKeysInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKKeysManager>) in
KeysManager_as_KeysInterface(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return KeysManager_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> KeysManager {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing KeysManager \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing KeysManager \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

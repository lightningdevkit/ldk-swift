import LDKHeaders

public class CounterpartyChannelTransactionParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCounterpartyChannelTransactionParameters?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkeys_arg: ChannelPublicKeys, selected_contest_delay_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = CounterpartyChannelTransactionParameters_new(pubkeys_arg.danglingClone().cOpaqueStruct!, selected_contest_delay_arg)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCounterpartyChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_pubkeys() -> ChannelPublicKeys {
    	
        return ChannelPublicKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_get_pubkeys(this_ptrPointer)
});
    }

    public func set_pubkeys(val: ChannelPublicKeys) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CounterpartyChannelTransactionParameters_set_pubkeys(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_selected_contest_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_get_selected_contest_delay(this_ptrPointer)
};
    }

    public func set_selected_contest_delay(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return CounterpartyChannelTransactionParameters_set_selected_contest_delay(this_ptrPointer, val);
    }

    public func clone() -> CounterpartyChannelTransactionParameters {
    	
        return CounterpartyChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_clone(origPointer)
});
    }

					internal func danglingClone() -> CounterpartyChannelTransactionParameters {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CounterpartyChannelTransactionParameters_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CounterpartyChannelTransactionParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> CounterpartyChannelTransactionParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing CounterpartyChannelTransactionParameters \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing CounterpartyChannelTransactionParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

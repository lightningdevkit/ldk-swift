public class CounterpartyChannelTransactionParameters {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCounterpartyChannelTransactionParameters?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkeys_arg: ChannelPublicKeys, selected_contest_delay_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = CounterpartyChannelTransactionParameters_new(pubkeys_arg.clone().cOpaqueStruct!, selected_contest_delay_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCounterpartyChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
						
        return CounterpartyChannelTransactionParameters_set_pubkeys(this_ptrPointer, val.clone().cOpaqueStruct!);
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
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CounterpartyChannelTransactionParameters_read(Bindings.new_LDKu8slice(array: ser)));
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
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

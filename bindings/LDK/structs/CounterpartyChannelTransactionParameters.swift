public class CounterpartyChannelTransactionParameters {

    var cOpaqueStruct: LDKCounterpartyChannelTransactionParameters?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(pubkeys_arg: ChannelPublicKeys, selected_contest_delay_arg: UInt16) {
    	
        self.cOpaqueStruct = CounterpartyChannelTransactionParameters_new(pubkeys_arg.cOpaqueStruct!, selected_contest_delay_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCounterpartyChannelTransactionParameters){
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
					
        return CounterpartyChannelTransactionParameters_set_pubkeys(this_ptrPointer, val.cOpaqueStruct!);
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

    public func clone(orig: CounterpartyChannelTransactionParameters) -> CounterpartyChannelTransactionParameters {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters(pointer: CounterpartyChannelTransactionParameters_clone(origPointer))
};
    }

    public func write(obj: CounterpartyChannelTransactionParameters) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
CounterpartyChannelTransactionParameters_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CounterpartyChannelTransactionParameters_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		CounterpartyChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

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
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return ChannelPublicKeys(pointer: CounterpartyChannelTransactionParameters_get_pubkeys(this_ptrPointer));
    }

    public func set_pubkeys(val: ChannelPublicKeys) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_set_pubkeys(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_selected_contest_delay() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_get_selected_contest_delay(this_ptrPointer);
    }

    public func set_selected_contest_delay(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_set_selected_contest_delay(this_ptrPointer, val);
    }

    public func clone(orig: CounterpartyChannelTransactionParameters) -> CounterpartyChannelTransactionParameters {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters(pointer: CounterpartyChannelTransactionParameters_clone(origPointer));
    }

    public func write(obj: CounterpartyChannelTransactionParameters) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: CounterpartyChannelTransactionParameters_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return Result_CounterpartyChannelTransactionParametersDecodeErrorZ(pointer: CounterpartyChannelTransactionParameters_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		CounterpartyChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

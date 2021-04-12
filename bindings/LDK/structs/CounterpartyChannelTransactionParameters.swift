class CounterpartyChannelTransactionParameters {

    var cOpaqueStruct: LDKCounterpartyChannelTransactionParameters?;

    init(pubkeys_arg: ChannelPublicKeys, selected_contest_delay_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = CounterpartyChannelTransactionParameters_new(pubkeys_arg, selected_contest_delay_arg)
    }

    private init(pointer: LDKCounterpartyChannelTransactionParameters){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_pubkeys() -> ChannelPublicKeys {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_get_pubkeys(this_ptrPointer);
    }

    func set_pubkeys(val: ChannelPublicKeys) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_set_pubkeys(this_ptrPointer, val);
    }

    func get_selected_contest_delay() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_get_selected_contest_delay(this_ptrPointer);
    }

    func set_selected_contest_delay(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_set_selected_contest_delay(this_ptrPointer, val);
    }

    func clone(orig: CounterpartyChannelTransactionParameters) -> CounterpartyChannelTransactionParameters {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters(pointer: CounterpartyChannelTransactionParameters_clone(origPointer));
    }

    func write(obj: CounterpartyChannelTransactionParameters) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
							
			pointer
						
		}
					
        return CounterpartyChannelTransactionParameters_write(objPointer);
    }

    func read(ser: [U]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
    	
        return CounterpartyChannelTransactionParameters_read(ser);
    }

				
	deinit {
					
					
		CounterpartyChannelTransactionParameters_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

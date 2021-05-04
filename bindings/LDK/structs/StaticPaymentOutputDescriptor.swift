class StaticPaymentOutputDescriptor {

    var cOpaqueStruct: LDKStaticPaymentOutputDescriptor?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(outpoint_arg: OutPoint, output_arg: TxOut, channel_keys_id_arg: [UInt8], channel_value_satoshis_arg: UInt64) {
    	
		let converted_channel_keys_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_keys_id_arg)
        self.cOpaqueStruct = StaticPaymentOutputDescriptor_new(outpoint_arg.cOpaqueStruct!, output_arg.cOpaqueStruct!, converted_channel_keys_id_arg, channel_value_satoshis_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKStaticPaymentOutputDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: StaticPaymentOutputDescriptor_get_outpoint(this_ptrPointer));
    }

    func set_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_outpoint(this_ptrPointer, val.cOpaqueStruct!);
    }

    func set_output(val: TxOut) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_output(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_channel_keys_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_get_channel_keys_id(this_ptrPointer).pointee;
    }

    func set_channel_keys_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_channel_keys_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_channel_value_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_get_channel_value_satoshis(this_ptrPointer);
    }

    func set_channel_value_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_channel_value_satoshis(this_ptrPointer, val);
    }

    func clone(orig: StaticPaymentOutputDescriptor) -> StaticPaymentOutputDescriptor {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor(pointer: StaticPaymentOutputDescriptor_clone(origPointer));
    }

				
	deinit {
					
					
		StaticPaymentOutputDescriptor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

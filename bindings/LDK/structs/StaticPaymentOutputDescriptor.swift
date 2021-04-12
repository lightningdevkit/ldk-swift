class StaticPaymentOutputDescriptor {

    var cOpaqueStruct: LDKStaticPaymentOutputDescriptor?;

    init(outpoint_arg: OutPoint, output_arg: TxOut, channel_keys_id_arg: [U], channel_value_satoshis_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = StaticPaymentOutputDescriptor_new(outpoint_arg, output_arg, channel_keys_id_arg, channel_value_satoshis_arg)
    }

    private init(pointer: LDKStaticPaymentOutputDescriptor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_get_outpoint(this_ptrPointer);
    }

    func set_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_outpoint(this_ptrPointer, val);
    }

    func set_output(val: TxOut) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_output(this_ptrPointer, val);
    }

    func get_channel_keys_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_get_channel_keys_id(this_ptrPointer);
    }

    func set_channel_keys_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_set_channel_keys_id(this_ptrPointer, val);
    }

    func get_channel_value_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
							
			pointer
						
		}
					
        return StaticPaymentOutputDescriptor_get_channel_value_satoshis(this_ptrPointer);
    }

    func set_channel_value_satoshis(val: U) -> Void {
    	
						
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

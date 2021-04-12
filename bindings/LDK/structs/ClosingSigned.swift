class ClosingSigned {

    var cOpaqueStruct: LDKClosingSigned?;

    init(channel_id_arg: [U], fee_satoshis_arg: U, signature_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ClosingSigned_new(channel_id_arg, fee_satoshis_arg, signature_arg)
    }

    private init(pointer: LDKClosingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_channel_id(this_ptrPointer, val);
    }

    func get_fee_satoshis() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_get_fee_satoshis(this_ptrPointer);
    }

    func set_fee_satoshis(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_fee_satoshis(this_ptrPointer, val);
    }

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_signature(this_ptrPointer, val);
    }

    func clone(orig: ClosingSigned) -> ClosingSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned(pointer: ClosingSigned_clone(origPointer));
    }

    func write(obj: ClosingSigned) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_write(objPointer);
    }

    func read(ser: [U]) -> Result_ClosingSignedDecodeErrorZ {
    	
        return ClosingSigned_read(ser);
    }

				
	deinit {
					
					
		ClosingSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

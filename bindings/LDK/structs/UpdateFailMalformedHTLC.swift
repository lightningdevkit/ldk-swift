class UpdateFailMalformedHTLC {

    var cOpaqueStruct: LDKUpdateFailMalformedHTLC?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUpdateFailMalformedHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_set_channel_id(this_ptrPointer, val);
    }

    func get_htlc_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_get_htlc_id(this_ptrPointer);
    }

    func set_htlc_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_set_htlc_id(this_ptrPointer, val);
    }

    func get_failure_code() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_get_failure_code(this_ptrPointer);
    }

    func set_failure_code(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_set_failure_code(this_ptrPointer, val);
    }

    func clone(orig: UpdateFailMalformedHTLC) -> UpdateFailMalformedHTLC {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC(pointer: UpdateFailMalformedHTLC_clone(origPointer));
    }

    func write(obj: UpdateFailMalformedHTLC) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailMalformedHTLC_write(objPointer);
    }

    func read(ser: [U]) -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	
        return UpdateFailMalformedHTLC_read(ser);
    }

				
	deinit {
					
					
		UpdateFailMalformedHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

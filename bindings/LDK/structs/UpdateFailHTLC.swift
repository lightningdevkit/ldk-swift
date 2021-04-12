class UpdateFailHTLC {

    var cOpaqueStruct: LDKUpdateFailHTLC?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKUpdateFailHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_set_channel_id(this_ptrPointer, val);
    }

    func get_htlc_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_get_htlc_id(this_ptrPointer);
    }

    func set_htlc_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_set_htlc_id(this_ptrPointer, val);
    }

    func clone(orig: UpdateFailHTLC) -> UpdateFailHTLC {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC(pointer: UpdateFailHTLC_clone(origPointer));
    }

    func write(obj: UpdateFailHTLC) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_write(objPointer);
    }

    func read(ser: [U]) -> Result_UpdateFailHTLCDecodeErrorZ {
    	
        return UpdateFailHTLC_read(ser);
    }

				
	deinit {
					
					
		UpdateFailHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

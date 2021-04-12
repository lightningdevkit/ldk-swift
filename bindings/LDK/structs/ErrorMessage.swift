class ErrorMessage {

    var cOpaqueStruct: LDKErrorMessage?;

    init(channel_id_arg: [U], data_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ErrorMessage_new(channel_id_arg, data_arg)
    }

    private init(pointer: LDKErrorMessage){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_set_channel_id(this_ptrPointer, val);
    }

    func get_data() -> String {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_get_data(this_ptrPointer);
    }

    func set_data(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_set_data(this_ptrPointer, val);
    }

    func clone(orig: ErrorMessage) -> ErrorMessage {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage(pointer: ErrorMessage_clone(origPointer));
    }

    func write(obj: ErrorMessage) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_write(objPointer);
    }

    func read(ser: [U]) -> Result_ErrorMessageDecodeErrorZ {
    	
        return ErrorMessage_read(ser);
    }

				
	deinit {
					
					
		ErrorMessage_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

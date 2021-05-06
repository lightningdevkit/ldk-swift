public class ErrorMessage {

    var cOpaqueStruct: LDKErrorMessage?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], data_arg: String) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_data_arg = Bindings.new_LDKStr(string: data_arg)
        self.cOpaqueStruct = ErrorMessage_new(converted_channel_id_arg, converted_data_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErrorMessage){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_get_channel_id(this_ptrPointer).pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_data() -> String {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return Bindings.LDKStr_to_string(nativeType: ErrorMessage_get_data(this_ptrPointer));
    }

    public func set_data(val: String) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage_set_data(this_ptrPointer, Bindings.new_LDKStr(string: val));
    }

    public func clone(orig: ErrorMessage) -> ErrorMessage {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return ErrorMessage(pointer: ErrorMessage_clone(origPointer));
    }

    public func write(obj: ErrorMessage) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKErrorMessage>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ErrorMessage_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_ErrorMessageDecodeErrorZ {
    	
        return Result_ErrorMessageDecodeErrorZ(pointer: ErrorMessage_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ErrorMessage_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

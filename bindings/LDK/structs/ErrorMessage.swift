public class ErrorMessage {

    var cOpaqueStruct: LDKErrorMessage?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], data_arg: String) {
    	
        self.cOpaqueStruct = ErrorMessage_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKStr(string: data_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErrorMessage){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKErrorMessage>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return ErrorMessage_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_data() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage_get_data(this_ptrPointer)
});
    }

    public func set_data(val: String) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKErrorMessage>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return ErrorMessage_set_data(this_ptrPointer, Bindings.new_LDKStr(string: val));
    }

    public func clone(orig: ErrorMessage) -> ErrorMessage {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage(pointer: ErrorMessage_clone(origPointer))
};
    }

    public func write(obj: ErrorMessage) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ErrorMessageDecodeErrorZ {
    	
        return Result_ErrorMessageDecodeErrorZ(pointer: ErrorMessage_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ErrorMessage_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

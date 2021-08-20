public class ErrorMessage {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKErrorMessage?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], data_arg: String) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ErrorMessage_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKStr(string: data_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKErrorMessage){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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

    public func clone() -> ErrorMessage {
    	
        return ErrorMessage(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage_clone(origPointer)
});
    }

					internal func danglingClone() -> ErrorMessage {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKErrorMessage>) in
ErrorMessage_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ErrorMessageDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ErrorMessageDecodeErrorZ(pointer: ErrorMessage_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ErrorMessage_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ErrorMessage {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ErrorMessage \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ErrorMessage \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

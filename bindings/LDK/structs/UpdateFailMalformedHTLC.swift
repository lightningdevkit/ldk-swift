public class UpdateFailMalformedHTLC {

    var cOpaqueStruct: LDKUpdateFailMalformedHTLC?;

	

    public init(pointer: LDKUpdateFailMalformedHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_htlc_id() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_htlc_id(this_ptrPointer)
};
    }

    public func set_htlc_id(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_set_htlc_id(this_ptrPointer, val)
};
    }

    public func get_failure_code() -> UInt16 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_failure_code(this_ptrPointer)
};
    }

    public func set_failure_code(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_set_failure_code(this_ptrPointer, val)
};
    }

    public func clone(orig: UpdateFailMalformedHTLC) -> UpdateFailMalformedHTLC {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC(pointer: UpdateFailMalformedHTLC_clone(origPointer))
};
    }

    public func write(obj: UpdateFailMalformedHTLC) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_UpdateFailMalformedHTLCDecodeErrorZ(pointer: UpdateFailMalformedHTLC_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UpdateFailMalformedHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

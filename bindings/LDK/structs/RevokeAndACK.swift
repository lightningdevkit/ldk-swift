public class RevokeAndACK {

    var cOpaqueStruct: LDKRevokeAndACK?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], per_commitment_secret_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_per_commitment_secret_arg = Bindings.new_LDKThirtyTwoBytes(array: per_commitment_secret_arg)
		let converted_next_per_commitment_point_arg = Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg)
        self.cOpaqueStruct = RevokeAndACK_new(converted_channel_id_arg, converted_per_commitment_secret_arg, converted_next_per_commitment_point_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRevokeAndACK){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
RevokeAndACK_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_per_commitment_secret() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_per_commitment_secret(this_ptrPointer)
}.pointee;
    }

    public func set_per_commitment_secret(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
RevokeAndACK_set_per_commitment_secret(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_next_per_commitment_point() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_next_per_commitment_point(this_ptrPointer)
});
    }

    public func set_next_per_commitment_point(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
RevokeAndACK_set_next_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func clone(orig: RevokeAndACK) -> RevokeAndACK {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK(pointer: RevokeAndACK_clone(origPointer))
};
    }

    public func write(obj: RevokeAndACK) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_RevokeAndACKDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_RevokeAndACKDecodeErrorZ(pointer: RevokeAndACK_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		RevokeAndACK_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class ChannelReestablish {

    var cOpaqueStruct: LDKChannelReestablish?;

	

    public init(pointer: LDKChannelReestablish){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelReestablish>) in
ChannelReestablish_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_next_local_commitment_number() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_local_commitment_number(this_ptrPointer)
};
    }

    public func set_next_local_commitment_number(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelReestablish>) in
ChannelReestablish_set_next_local_commitment_number(this_ptrPointer, val)
};
    }

    public func get_next_remote_commitment_number() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_remote_commitment_number(this_ptrPointer)
};
    }

    public func set_next_remote_commitment_number(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelReestablish>) in
ChannelReestablish_set_next_remote_commitment_number(this_ptrPointer, val)
};
    }

    public func clone(orig: ChannelReestablish) -> ChannelReestablish {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish(pointer: ChannelReestablish_clone(origPointer))
};
    }

    public func write(obj: ChannelReestablish) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelReestablishDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_ChannelReestablishDecodeErrorZ(pointer: ChannelReestablish_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelReestablish_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

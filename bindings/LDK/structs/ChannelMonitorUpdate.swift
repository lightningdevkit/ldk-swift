public class ChannelMonitorUpdate {

    var cOpaqueStruct: LDKChannelMonitorUpdate?;

	

    public init(pointer: LDKChannelMonitorUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_update_id() -> UInt64 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_get_update_id(this_ptrPointer)
};
    }

    public func set_update_id(val: UInt64) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_set_update_id(this_ptrPointer, val)
};
    }

    public func clone(orig: ChannelMonitorUpdate) -> ChannelMonitorUpdate {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate(pointer: ChannelMonitorUpdate_clone(origPointer))
};
    }

    public func write(obj: ChannelMonitorUpdate) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: ChannelMonitorUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelMonitorUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

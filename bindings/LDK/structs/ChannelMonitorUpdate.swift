public class ChannelMonitorUpdate {

    public internal(set) var cOpaqueStruct: LDKChannelMonitorUpdate?;

	

    public init(pointer: LDKChannelMonitorUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_update_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_get_update_id(this_ptrPointer)
};
    }

    public func set_update_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelMonitorUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelMonitorUpdate_set_update_id(this_ptrPointer, val);
    }

    public func clone() -> ChannelMonitorUpdate {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate(pointer: ChannelMonitorUpdate_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: ChannelMonitorUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelMonitorUpdate_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

public class ChannelReestablish {

    public internal(set) var cOpaqueStruct: LDKChannelReestablish?;

	

    public init(pointer: LDKChannelReestablish){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelReestablish_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_next_local_commitment_number() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_local_commitment_number(this_ptrPointer)
};
    }

    public func set_next_local_commitment_number(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelReestablish_set_next_local_commitment_number(this_ptrPointer, val);
    }

    public func get_next_remote_commitment_number() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_get_next_remote_commitment_number(this_ptrPointer)
};
    }

    public func set_next_remote_commitment_number(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelReestablish>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelReestablish_set_next_remote_commitment_number(this_ptrPointer, val);
    }

    public func clone() -> ChannelReestablish {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish(pointer: ChannelReestablish_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelReestablish>) in
ChannelReestablish_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelReestablishDecodeErrorZ {
    	
        return Result_ChannelReestablishDecodeErrorZ(pointer: ChannelReestablish_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		ChannelReestablish_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}

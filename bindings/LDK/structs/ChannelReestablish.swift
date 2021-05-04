class ChannelReestablish {

    var cOpaqueStruct: LDKChannelReestablish?;

	

    init(pointer: LDKChannelReestablish){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_next_local_commitment_number() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_next_local_commitment_number(this_ptrPointer);
    }

    func set_next_local_commitment_number(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_set_next_local_commitment_number(this_ptrPointer, val);
    }

    func get_next_remote_commitment_number() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_next_remote_commitment_number(this_ptrPointer);
    }

    func set_next_remote_commitment_number(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_set_next_remote_commitment_number(this_ptrPointer, val);
    }

    func clone(orig: ChannelReestablish) -> ChannelReestablish {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish(pointer: ChannelReestablish_clone(origPointer));
    }

    func write(obj: ChannelReestablish) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelReestablish_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelReestablishDecodeErrorZ {
    	
        return Result_ChannelReestablishDecodeErrorZ(pointer: ChannelReestablish_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelReestablish_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

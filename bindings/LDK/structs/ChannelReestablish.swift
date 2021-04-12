class ChannelReestablish {

    var cOpaqueStruct: LDKChannelReestablish?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKChannelReestablish){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_set_channel_id(this_ptrPointer, val);
    }

    func get_next_local_commitment_number() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_next_local_commitment_number(this_ptrPointer);
    }

    func set_next_local_commitment_number(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_set_next_local_commitment_number(this_ptrPointer, val);
    }

    func get_next_remote_commitment_number() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_get_next_remote_commitment_number(this_ptrPointer);
    }

    func set_next_remote_commitment_number(val: U) -> Void {
    	
						
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

    func write(obj: ChannelReestablish) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelReestablish>) in
							
			pointer
						
		}
					
        return ChannelReestablish_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelReestablishDecodeErrorZ {
    	
        return ChannelReestablish_read(ser);
    }

				
	deinit {
					
					
		ChannelReestablish_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class ChannelUpdate {

    var cOpaqueStruct: LDKChannelUpdate?;

    init(signature_arg: [U], contents_arg: UnsignedChannelUpdate) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelUpdate_new(signature_arg, contents_arg)
    }

    private init(pointer: LDKChannelUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_set_signature(this_ptrPointer, val);
    }

    func get_contents() -> UnsignedChannelUpdate {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_get_contents(this_ptrPointer);
    }

    func set_contents(val: UnsignedChannelUpdate) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_set_contents(this_ptrPointer, val);
    }

    func clone(orig: ChannelUpdate) -> ChannelUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate(pointer: ChannelUpdate_clone(origPointer));
    }

    func write(obj: ChannelUpdate) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelUpdateDecodeErrorZ {
    	
        return ChannelUpdate_read(ser);
    }

				
	deinit {
					
					
		ChannelUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

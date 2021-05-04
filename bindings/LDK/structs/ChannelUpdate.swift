class ChannelUpdate {

    var cOpaqueStruct: LDKChannelUpdate?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(signature_arg: [UInt8], contents_arg: UnsignedChannelUpdate) {
    	
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = ChannelUpdate_new(converted_signature_arg, contents_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ChannelUpdate_get_signature(this_ptrPointer));
    }

    func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func get_contents() -> UnsignedChannelUpdate {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return UnsignedChannelUpdate(pointer: ChannelUpdate_get_contents(this_ptrPointer));
    }

    func set_contents(val: UnsignedChannelUpdate) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate_set_contents(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: ChannelUpdate) -> ChannelUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return ChannelUpdate(pointer: ChannelUpdate_clone(origPointer));
    }

    func write(obj: ChannelUpdate) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelUpdate>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelUpdate_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelUpdateDecodeErrorZ {
    	
        return Result_ChannelUpdateDecodeErrorZ(pointer: ChannelUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

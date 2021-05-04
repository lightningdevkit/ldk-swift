class ChannelAnnouncement {

    var cOpaqueStruct: LDKChannelAnnouncement?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(node_signature_1_arg: [UInt8], node_signature_2_arg: [UInt8], bitcoin_signature_1_arg: [UInt8], bitcoin_signature_2_arg: [UInt8], contents_arg: UnsignedChannelAnnouncement) {
    	
		let converted_node_signature_1_arg = Bindings.new_LDKSignature(array: node_signature_1_arg)
		let converted_node_signature_2_arg = Bindings.new_LDKSignature(array: node_signature_2_arg)
		let converted_bitcoin_signature_1_arg = Bindings.new_LDKSignature(array: bitcoin_signature_1_arg)
		let converted_bitcoin_signature_2_arg = Bindings.new_LDKSignature(array: bitcoin_signature_2_arg)
        self.cOpaqueStruct = ChannelAnnouncement_new(converted_node_signature_1_arg, converted_node_signature_2_arg, converted_bitcoin_signature_1_arg, converted_bitcoin_signature_2_arg, contents_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_node_signature_1() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ChannelAnnouncement_get_node_signature_1(this_ptrPointer));
    }

    func set_node_signature_1(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_node_signature_1(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func get_node_signature_2() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ChannelAnnouncement_get_node_signature_2(this_ptrPointer));
    }

    func set_node_signature_2(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_node_signature_2(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func get_bitcoin_signature_1() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ChannelAnnouncement_get_bitcoin_signature_1(this_ptrPointer));
    }

    func set_bitcoin_signature_1(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_bitcoin_signature_1(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func get_bitcoin_signature_2() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ChannelAnnouncement_get_bitcoin_signature_2(this_ptrPointer));
    }

    func set_bitcoin_signature_2(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_bitcoin_signature_2(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func get_contents() -> UnsignedChannelAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedChannelAnnouncement(pointer: ChannelAnnouncement_get_contents(this_ptrPointer));
    }

    func set_contents(val: UnsignedChannelAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_contents(this_ptrPointer, val.cOpaqueStruct!);
    }

    func clone(orig: ChannelAnnouncement) -> ChannelAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement(pointer: ChannelAnnouncement_clone(origPointer));
    }

    func write(obj: ChannelAnnouncement) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelAnnouncement_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelAnnouncementDecodeErrorZ {
    	
        return Result_ChannelAnnouncementDecodeErrorZ(pointer: ChannelAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

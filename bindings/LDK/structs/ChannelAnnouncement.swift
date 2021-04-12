class ChannelAnnouncement {

    var cOpaqueStruct: LDKChannelAnnouncement?;

    init(node_signature_1_arg: [U], node_signature_2_arg: [U], bitcoin_signature_1_arg: [U], bitcoin_signature_2_arg: [U], contents_arg: UnsignedChannelAnnouncement) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelAnnouncement_new(node_signature_1_arg, node_signature_2_arg, bitcoin_signature_1_arg, bitcoin_signature_2_arg, contents_arg)
    }

    private init(pointer: LDKChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_node_signature_1() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_get_node_signature_1(this_ptrPointer);
    }

    func set_node_signature_1(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_node_signature_1(this_ptrPointer, val);
    }

    func get_node_signature_2() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_get_node_signature_2(this_ptrPointer);
    }

    func set_node_signature_2(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_node_signature_2(this_ptrPointer, val);
    }

    func get_bitcoin_signature_1() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_get_bitcoin_signature_1(this_ptrPointer);
    }

    func set_bitcoin_signature_1(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_bitcoin_signature_1(this_ptrPointer, val);
    }

    func get_bitcoin_signature_2() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_get_bitcoin_signature_2(this_ptrPointer);
    }

    func set_bitcoin_signature_2(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_bitcoin_signature_2(this_ptrPointer, val);
    }

    func get_contents() -> UnsignedChannelAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_get_contents(this_ptrPointer);
    }

    func set_contents(val: UnsignedChannelAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_set_contents(this_ptrPointer, val);
    }

    func clone(orig: ChannelAnnouncement) -> ChannelAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement(pointer: ChannelAnnouncement_clone(origPointer));
    }

    func write(obj: ChannelAnnouncement) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelAnnouncement>) in
							
			pointer
						
		}
					
        return ChannelAnnouncement_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelAnnouncementDecodeErrorZ {
    	
        return ChannelAnnouncement_read(ser);
    }

				
	deinit {
					
					
		ChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class AnnouncementSignatures {

    var cOpaqueStruct: LDKAnnouncementSignatures?;

    init(channel_id_arg: [U], short_channel_id_arg: U, node_signature_arg: [U], bitcoin_signature_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = AnnouncementSignatures_new(channel_id_arg, short_channel_id_arg, node_signature_arg, bitcoin_signature_arg)
    }

    private init(pointer: LDKAnnouncementSignatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_set_channel_id(this_ptrPointer, val);
    }

    func get_short_channel_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_get_short_channel_id(this_ptrPointer);
    }

    func set_short_channel_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_set_short_channel_id(this_ptrPointer, val);
    }

    func get_node_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_get_node_signature(this_ptrPointer);
    }

    func set_node_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_set_node_signature(this_ptrPointer, val);
    }

    func get_bitcoin_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_get_bitcoin_signature(this_ptrPointer);
    }

    func set_bitcoin_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_set_bitcoin_signature(this_ptrPointer, val);
    }

    func clone(orig: AnnouncementSignatures) -> AnnouncementSignatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures(pointer: AnnouncementSignatures_clone(origPointer));
    }

    func write(obj: AnnouncementSignatures) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKAnnouncementSignatures>) in
							
			pointer
						
		}
					
        return AnnouncementSignatures_write(objPointer);
    }

    func read(ser: [U]) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return AnnouncementSignatures_read(ser);
    }

				
	deinit {
					
					
		AnnouncementSignatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

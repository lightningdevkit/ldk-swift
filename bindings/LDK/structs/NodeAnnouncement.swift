class NodeAnnouncement {

    var cOpaqueStruct: LDKNodeAnnouncement?;

    init(signature_arg: [U], contents_arg: UnsignedNodeAnnouncement) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = NodeAnnouncement_new(signature_arg, contents_arg)
    }

    private init(pointer: LDKNodeAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_set_signature(this_ptrPointer, val);
    }

    func get_contents() -> UnsignedNodeAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_get_contents(this_ptrPointer);
    }

    func set_contents(val: UnsignedNodeAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_set_contents(this_ptrPointer, val);
    }

    func clone(orig: NodeAnnouncement) -> NodeAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement(pointer: NodeAnnouncement_clone(origPointer));
    }

    func write(obj: NodeAnnouncement) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_write(objPointer);
    }

    func read(ser: [U]) -> Result_NodeAnnouncementDecodeErrorZ {
    	
        return NodeAnnouncement_read(ser);
    }

				
	deinit {
					
					
		NodeAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

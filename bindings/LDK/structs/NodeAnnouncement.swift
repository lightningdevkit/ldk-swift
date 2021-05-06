public class NodeAnnouncement {

    var cOpaqueStruct: LDKNodeAnnouncement?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(signature_arg: [UInt8], contents_arg: UnsignedNodeAnnouncement) {
    	
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = NodeAnnouncement_new(converted_signature_arg, contents_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: NodeAnnouncement_get_signature(this_ptrPointer));
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func get_contents() -> UnsignedNodeAnnouncement {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return UnsignedNodeAnnouncement(pointer: NodeAnnouncement_get_contents(this_ptrPointer));
    }

    public func set_contents(val: UnsignedNodeAnnouncement) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement_set_contents(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: NodeAnnouncement) -> NodeAnnouncement {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return NodeAnnouncement(pointer: NodeAnnouncement_clone(origPointer));
    }

    public func write(obj: NodeAnnouncement) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeAnnouncement>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: NodeAnnouncement_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_NodeAnnouncementDecodeErrorZ {
    	
        return Result_NodeAnnouncementDecodeErrorZ(pointer: NodeAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		NodeAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

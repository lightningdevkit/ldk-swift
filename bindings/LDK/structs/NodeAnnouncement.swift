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
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func get_contents() -> UnsignedNodeAnnouncement {
    	/* NATIVE_CALL_PREP */
        return UnsignedNodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_get_contents(this_ptrPointer)
});
    }

    public func set_contents(val: UnsignedNodeAnnouncement) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_set_contents(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: NodeAnnouncement) -> NodeAnnouncement {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement(pointer: NodeAnnouncement_clone(origPointer))
};
    }

    public func write(obj: NodeAnnouncement) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_NodeAnnouncementDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NodeAnnouncementDecodeErrorZ(pointer: NodeAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		NodeAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

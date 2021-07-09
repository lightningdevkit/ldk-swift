public class ChannelAnnouncement {

    var cOpaqueStruct: LDKChannelAnnouncement?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(node_signature_1_arg: [UInt8], node_signature_2_arg: [UInt8], bitcoin_signature_1_arg: [UInt8], bitcoin_signature_2_arg: [UInt8], contents_arg: UnsignedChannelAnnouncement) {
    	
		let converted_node_signature_1_arg = Bindings.new_LDKSignature(array: node_signature_1_arg)
		let converted_node_signature_2_arg = Bindings.new_LDKSignature(array: node_signature_2_arg)
		let converted_bitcoin_signature_1_arg = Bindings.new_LDKSignature(array: bitcoin_signature_1_arg)
		let converted_bitcoin_signature_2_arg = Bindings.new_LDKSignature(array: bitcoin_signature_2_arg)
        self.cOpaqueStruct = ChannelAnnouncement_new(converted_node_signature_1_arg, converted_node_signature_2_arg, converted_bitcoin_signature_1_arg, converted_bitcoin_signature_2_arg, contents_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_node_signature_1() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_get_node_signature_1(this_ptrPointer)
});
    }

    public func set_node_signature_1(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_set_node_signature_1(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func get_node_signature_2() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_get_node_signature_2(this_ptrPointer)
});
    }

    public func set_node_signature_2(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_set_node_signature_2(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func get_bitcoin_signature_1() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_get_bitcoin_signature_1(this_ptrPointer)
});
    }

    public func set_bitcoin_signature_1(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_set_bitcoin_signature_1(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func get_bitcoin_signature_2() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_get_bitcoin_signature_2(this_ptrPointer)
});
    }

    public func set_bitcoin_signature_2(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_set_bitcoin_signature_2(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func get_contents() -> UnsignedChannelAnnouncement {
    	/* NATIVE_CALL_PREP */
        return UnsignedChannelAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_get_contents(this_ptrPointer)
});
    }

    public func set_contents(val: UnsignedChannelAnnouncement) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_set_contents(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: ChannelAnnouncement) -> ChannelAnnouncement {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement(pointer: ChannelAnnouncement_clone(origPointer))
};
    }

    public func write(obj: ChannelAnnouncement) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelAnnouncement>) in
ChannelAnnouncement_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelAnnouncementDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_ChannelAnnouncementDecodeErrorZ(pointer: ChannelAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelAnnouncement_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class NodeAnnouncementInfo {

    var cOpaqueStruct: LDKNodeAnnouncementInfo?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: NodeFeatures, last_update_arg: UInt32, rgb_arg: [UInt8], alias_arg: [UInt8], addresses_arg: [LDKNetAddress], announcement_message_arg: NodeAnnouncement) {
    	
		let converted_rgb_arg = Bindings.new_LDKThreeBytes(array: rgb_arg)
		let converted_alias_arg = Bindings.new_LDKThirtyTwoBytes(array: alias_arg)
		let converted_addresses_arg = Bindings.new_LDKCVec_NetAddressZ(array: addresses_arg)
        self.cOpaqueStruct = NodeAnnouncementInfo_new(features_arg.cOpaqueStruct!, last_update_arg, converted_rgb_arg, converted_alias_arg, converted_addresses_arg, announcement_message_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncementInfo){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> NodeFeatures {
    	/* NATIVE_CALL_PREP */
        return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_features(this_ptrPointer)
});
    }

    public func set_features(val: NodeFeatures) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_features(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_last_update() -> UInt32 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_last_update(this_ptrPointer)
};
    }

    public func set_last_update(val: UInt32) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_last_update(this_ptrPointer, val)
};
    }

    public func get_rgb() -> (UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_rgb(this_ptrPointer)
}.pointee;
    }

    public func set_rgb(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_rgb(this_ptrPointer, Bindings.new_LDKThreeBytes(array: val))
};
    }

    public func get_alias() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_alias(this_ptrPointer)
}.pointee;
    }

    public func set_alias(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_alias(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func set_addresses(val: [LDKNetAddress]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_addresses(this_ptrPointer, Bindings.new_LDKCVec_NetAddressZ(array: val))
};
    }

    public func get_announcement_message() -> NodeAnnouncement {
    	/* NATIVE_CALL_PREP */
        return NodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_announcement_message(this_ptrPointer)
});
    }

    public func set_announcement_message(val: NodeAnnouncement) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_set_announcement_message(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: NodeAnnouncementInfo) -> NodeAnnouncementInfo {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo(pointer: NodeAnnouncementInfo_clone(origPointer))
};
    }

    public func write(obj: NodeAnnouncementInfo) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: NodeAnnouncementInfo_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		NodeAnnouncementInfo_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class UnsignedNodeAnnouncement {

    var cOpaqueStruct: LDKUnsignedNodeAnnouncement?;

	

    public init(pointer: LDKUnsignedNodeAnnouncement){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> NodeFeatures {
    	
        return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_get_features(this_ptrPointer)
});
    }

    public func set_features(val: NodeFeatures) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_timestamp() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_get_timestamp(this_ptrPointer)
};
    }

    public func set_timestamp(val: UInt32) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_timestamp(this_ptrPointer, val);
    }

    public func get_node_id() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_get_node_id(this_ptrPointer)
});
    }

    public func set_node_id(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_node_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_rgb() -> [UInt8] {
    	
        return Bindings.tuple3_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_get_rgb(this_ptrPointer)
}.pointee);
    }

    public func set_rgb(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_rgb(this_ptrPointer, Bindings.new_LDKThreeBytes(array: val));
    }

    public func get_alias() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_get_alias(this_ptrPointer)
}.pointee);
    }

    public func set_alias(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_alias(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func set_addresses(val: [LDKNetAddress]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return UnsignedNodeAnnouncement_set_addresses(this_ptrPointer, Bindings.new_LDKCVec_NetAddressZ(array: val));
    }

    public func clone(orig: UnsignedNodeAnnouncement) -> UnsignedNodeAnnouncement {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement(pointer: UnsignedNodeAnnouncement_clone(origPointer))
};
    }

    public func write(obj: UnsignedNodeAnnouncement) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: UnsignedNodeAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		UnsignedNodeAnnouncement_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

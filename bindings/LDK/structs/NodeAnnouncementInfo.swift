public class NodeAnnouncementInfo {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKNodeAnnouncementInfo?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: NodeFeatures, last_update_arg: UInt32, rgb_arg: [UInt8], alias_arg: [UInt8], addresses_arg: [LDKNetAddress], announcement_message_arg: NodeAnnouncement) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NodeAnnouncementInfo_new(features_arg.danglingClone().cOpaqueStruct!, last_update_arg, Bindings.new_LDKThreeBytes(array: rgb_arg), Bindings.new_LDKThirtyTwoBytes(array: alias_arg), Bindings.new_LDKCVec_NetAddressZWrapper(array: addresses_arg).cOpaqueStruct!, announcement_message_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncementInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> NodeFeatures {
    	
        return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_features(this_ptrPointer)
});
    }

    public func set_features(val: NodeFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_last_update() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_last_update(this_ptrPointer)
};
    }

    public func set_last_update(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_last_update(this_ptrPointer, val);
    }

    public func get_rgb() -> [UInt8] {
    	
        return Bindings.tuple3_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_rgb(this_ptrPointer)
}.pointee);
    }

    public func set_rgb(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_rgb(this_ptrPointer, Bindings.new_LDKThreeBytes(array: val));
    }

    public func get_alias() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_alias(this_ptrPointer)
}.pointee);
    }

    public func set_alias(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_alias(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func set_addresses(val: [LDKNetAddress]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_addresses(this_ptrPointer, Bindings.new_LDKCVec_NetAddressZWrapper(array: val).cOpaqueStruct!);
    }

    public func get_announcement_message() -> NodeAnnouncement {
    	
        return NodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_announcement_message(this_ptrPointer)
});
    }

    public func set_announcement_message(val: NodeAnnouncement) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_announcement_message(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> NodeAnnouncementInfo {
    	
        return NodeAnnouncementInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_clone(origPointer)
});
    }

					internal func danglingClone() -> NodeAnnouncementInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeAnnouncementInfoDecodeErrorZ {
    	
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: NodeAnnouncementInfo_read(Bindings.new_LDKu8sliceWrapper(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return NodeAnnouncementInfo_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NodeAnnouncementInfo {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing NodeAnnouncementInfo \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing NodeAnnouncementInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

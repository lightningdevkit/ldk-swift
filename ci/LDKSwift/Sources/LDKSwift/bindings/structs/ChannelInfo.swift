#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ChannelInfo: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelInfo?


	

    public init(pointer: LDKChannelInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelInfo, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> ChannelFeatures {
    	
        return ChannelFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_features(this_ptrPointer)
});
    }

    public func set_features(val: ChannelFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_node_one() -> NodeId {
    	
        return NodeId(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_node_one(this_ptrPointer)
});
    }

    public func set_node_one(val: NodeId) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_node_one(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_one_to_two() -> ChannelUpdateInfo {
    	
        return ChannelUpdateInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_one_to_two(this_ptrPointer)
});
    }

    public func set_one_to_two(val: ChannelUpdateInfo) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_one_to_two(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_node_two() -> NodeId {
    	
        return NodeId(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_node_two(this_ptrPointer)
});
    }

    public func set_node_two(val: NodeId) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_node_two(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_two_to_one() -> ChannelUpdateInfo {
    	
        return ChannelUpdateInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_two_to_one(this_ptrPointer)
});
    }

    public func set_two_to_one(val: ChannelUpdateInfo) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_two_to_one(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_capacity_sats() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_capacity_sats(this_ptrPointer)
});
    }

    public func set_capacity_sats(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_capacity_sats(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_announcement_message() -> ChannelAnnouncement {
    	
        return ChannelAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_announcement_message(this_ptrPointer)
});
    }

    public func set_announcement_message(val: ChannelAnnouncement) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelInfo_set_announcement_message(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChannelInfo {
    	
        return ChannelInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func get_directional_info(channel_flags: UInt8) -> ChannelUpdateInfo {
    	
        return ChannelUpdateInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_get_directional_info(this_argPointer, channel_flags)
});
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelInfo>) in
ChannelInfo_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelInfoDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelInfoDecodeErrorZ(pointer: ChannelInfo_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelInfo_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelInfo {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class NodeAnnouncementInfo: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKNodeAnnouncementInfo?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(features_arg: NodeFeatures, last_update_arg: UInt32, rgb_arg: [UInt8], alias_arg: NodeAlias, addresses_arg: [LDKNetAddress], announcement_message_arg: NodeAnnouncement) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let addresses_argWrapper = Bindings.new_LDKCVec_NetAddressZWrapper(array: addresses_arg)
						defer {
							addresses_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = NodeAnnouncementInfo_new(features_arg.danglingClone().cOpaqueStruct!, last_update_arg, Bindings.new_LDKThreeBytes(array: rgb_arg), alias_arg.danglingClone().cOpaqueStruct!, addresses_argWrapper.dangle().cOpaqueStruct!, announcement_message_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncementInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKNodeAnnouncementInfo, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(features_arg: NodeFeatures, last_update_arg: UInt32, rgb_arg: [UInt8], alias_arg: NodeAlias, addresses_arg: [NetAddress], announcement_message_arg: NodeAnnouncement)  {
    	
							let addresses_argUnwrapped = addresses_arg.map { (addresses_argCurrentValue) in
							addresses_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        self.init(features_arg: features_arg, last_update_arg: last_update_arg, rgb_arg: rgb_arg, alias_arg: alias_arg, addresses_arg: addresses_argUnwrapped, announcement_message_arg: announcement_message_arg);
    }

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

    public func get_alias() -> NodeAlias {
    	
        return NodeAlias(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
NodeAnnouncementInfo_get_alias(this_ptrPointer)
});
    }

    public func set_alias(val: NodeAlias) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncementInfo_set_alias(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func set_addresses(val: [NetAddress]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_addresses(val: valUnwrapped);
    }

    internal func set_addresses(val: [LDKNetAddress]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncementInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_NetAddressZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return NodeAnnouncementInfo_set_addresses(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
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
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NodeAnnouncementInfoDecodeErrorZ(pointer: NodeAnnouncementInfo_read(serWrapper.cOpaqueStruct!));
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
							Bindings.print("Freeing NodeAnnouncementInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeAnnouncementInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

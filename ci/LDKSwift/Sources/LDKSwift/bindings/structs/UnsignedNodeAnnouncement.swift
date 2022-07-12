#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class UnsignedNodeAnnouncement: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKUnsignedNodeAnnouncement?


	

    public init(pointer: LDKUnsignedNodeAnnouncement){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKUnsignedNodeAnnouncement, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
						
        return UnsignedNodeAnnouncement_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
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

    public func set_addresses(val: [NetAddress]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_addresses(val: valUnwrapped);
    }

    internal func set_addresses(val: [LDKNetAddress]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedNodeAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_NetAddressZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return UnsignedNodeAnnouncement_set_addresses(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> UnsignedNodeAnnouncement {
    	
        return UnsignedNodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_clone(origPointer)
});
    }

					internal func danglingClone() -> UnsignedNodeAnnouncement {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
UnsignedNodeAnnouncement_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UnsignedNodeAnnouncementDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_UnsignedNodeAnnouncementDecodeErrorZ(pointer: UnsignedNodeAnnouncement_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return UnsignedNodeAnnouncement_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UnsignedNodeAnnouncement {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing UnsignedNodeAnnouncement \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedNodeAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

public class NodeAnnouncement: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKNodeAnnouncement?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(signature_arg: [UInt8], contents_arg: UnsignedNodeAnnouncement) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NodeAnnouncement_new(Bindings.new_LDKSignature(array: signature_arg), contents_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncement){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncement_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func get_contents() -> UnsignedNodeAnnouncement {
    	
        return UnsignedNodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_get_contents(this_ptrPointer)
});
    }

    public func set_contents(val: UnsignedNodeAnnouncement) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeAnnouncement>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeAnnouncement_set_contents(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> NodeAnnouncement {
    	
        return NodeAnnouncement(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_clone(origPointer)
});
    }

					internal func danglingClone() -> NodeAnnouncement {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeAnnouncementDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NodeAnnouncementDecodeErrorZ(pointer: NodeAnnouncement_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return NodeAnnouncement_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NodeAnnouncement {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeAnnouncement \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

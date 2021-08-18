public class NodeAnnouncement {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKNodeAnnouncement?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(signature_arg: [UInt8], contents_arg: UnsignedNodeAnnouncement) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NodeAnnouncement_new(Bindings.new_LDKSignature(array: signature_arg), contents_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeAnnouncement){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeAnnouncement>) in
NodeAnnouncement_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeAnnouncementDecodeErrorZ {
    	
        return Result_NodeAnnouncementDecodeErrorZ(pointer: NodeAnnouncement_read(Bindings.new_LDKu8slice(array: ser)));
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
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}

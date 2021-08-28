public class GossipTimestampFilter: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKGossipTimestampFilter?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], first_timestamp_arg: UInt32, timestamp_range_arg: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = GossipTimestampFilter_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), first_timestamp_arg, timestamp_range_arg)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKGossipTimestampFilter){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKGossipTimestampFilter, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
GossipTimestampFilter_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKGossipTimestampFilter>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return GossipTimestampFilter_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_first_timestamp() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
GossipTimestampFilter_get_first_timestamp(this_ptrPointer)
};
    }

    public func set_first_timestamp(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKGossipTimestampFilter>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return GossipTimestampFilter_set_first_timestamp(this_ptrPointer, val);
    }

    public func get_timestamp_range() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
GossipTimestampFilter_get_timestamp_range(this_ptrPointer)
};
    }

    public func set_timestamp_range(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKGossipTimestampFilter>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return GossipTimestampFilter_set_timestamp_range(this_ptrPointer, val);
    }

    public func clone() -> GossipTimestampFilter {
    	
        return GossipTimestampFilter(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKGossipTimestampFilter>) in
GossipTimestampFilter_clone(origPointer)
});
    }

					internal func danglingClone() -> GossipTimestampFilter {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func read(ser: [UInt8]) -> Result_GossipTimestampFilterDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_GossipTimestampFilterDecodeErrorZ(pointer: GossipTimestampFilter_read(serWrapper.cOpaqueStruct!));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKGossipTimestampFilter>) in
GossipTimestampFilter_write(objPointer)
});
    }

    internal func free() -> Void {
    	
        return GossipTimestampFilter_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> GossipTimestampFilter {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing GossipTimestampFilter \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing GossipTimestampFilter \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

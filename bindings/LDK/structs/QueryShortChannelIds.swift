public class QueryShortChannelIds: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKQueryShortChannelIds?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], short_channel_ids_arg: [UInt64]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let short_channel_ids_argWrapper = Bindings.new_LDKCVec_u64ZWrapper(array: short_channel_ids_arg)
						defer {
							short_channel_ids_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = QueryShortChannelIds_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), short_channel_ids_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKQueryShortChannelIds){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryShortChannelIds>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return QueryShortChannelIds_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func set_short_channel_ids(val: [UInt64]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKQueryShortChannelIds>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u64ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return QueryShortChannelIds_set_short_channel_ids(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> QueryShortChannelIds {
    	
        return QueryShortChannelIds(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds_clone(origPointer)
});
    }

					internal func danglingClone() -> QueryShortChannelIds {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func read(ser: [UInt8]) -> Result_QueryShortChannelIdsDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_QueryShortChannelIdsDecodeErrorZ(pointer: QueryShortChannelIds_read(serWrapper.cOpaqueStruct!));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKQueryShortChannelIds>) in
QueryShortChannelIds_write(objPointer)
});
    }

    internal func free() -> Void {
    	
        return QueryShortChannelIds_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> QueryShortChannelIds {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing QueryShortChannelIds \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing QueryShortChannelIds \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

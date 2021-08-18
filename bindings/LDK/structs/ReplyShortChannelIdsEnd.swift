import LDKHeaders

public class ReplyShortChannelIdsEnd {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKReplyShortChannelIdsEnd?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], full_information_arg: Bool) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ReplyShortChannelIdsEnd_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), full_information_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKReplyShortChannelIdsEnd){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyShortChannelIdsEnd_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_full_information() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_get_full_information(this_ptrPointer)
};
    }

    public func set_full_information(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKReplyShortChannelIdsEnd>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ReplyShortChannelIdsEnd_set_full_information(this_ptrPointer, val);
    }

    public func clone() -> ReplyShortChannelIdsEnd {
    	
        return ReplyShortChannelIdsEnd(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_clone(origPointer)
});
    }

					internal func danglingClone() -> ReplyShortChannelIdsEnd {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func read(ser: [UInt8]) -> Result_ReplyShortChannelIdsEndDecodeErrorZ {
    	
        return Result_ReplyShortChannelIdsEndDecodeErrorZ(pointer: ReplyShortChannelIdsEnd_read(Bindings.new_LDKu8slice(array: ser)));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKReplyShortChannelIdsEnd>) in
ReplyShortChannelIdsEnd_write(objPointer)
});
    }

    internal func free() -> Void {
    	
        return ReplyShortChannelIdsEnd_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ReplyShortChannelIdsEnd {
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

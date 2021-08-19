public class RevokeAndACK {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKRevokeAndACK?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], per_commitment_secret_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = RevokeAndACK_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKThirtyTwoBytes(array: per_commitment_secret_arg), Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKRevokeAndACK){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRevokeAndACK>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RevokeAndACK_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_per_commitment_secret() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_per_commitment_secret(this_ptrPointer)
}.pointee);
    }

    public func set_per_commitment_secret(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRevokeAndACK>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RevokeAndACK_set_per_commitment_secret(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_next_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_get_next_per_commitment_point(this_ptrPointer)
});
    }

    public func set_next_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRevokeAndACK>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RevokeAndACK_set_next_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> RevokeAndACK {
    	
        return RevokeAndACK(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_clone(origPointer)
});
    }

					internal func danglingClone() -> RevokeAndACK {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKRevokeAndACK>) in
RevokeAndACK_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_RevokeAndACKDecodeErrorZ {
    	
        return Result_RevokeAndACKDecodeErrorZ(pointer: RevokeAndACK_read(Bindings.new_LDKu8sliceWrapper(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return RevokeAndACK_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RevokeAndACK {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing RevokeAndACK \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing RevokeAndACK \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

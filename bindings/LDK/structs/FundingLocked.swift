public class FundingLocked: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKFundingLocked?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = FundingLocked_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg))
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingLocked){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingLocked>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingLocked_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_next_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked_get_next_per_commitment_point(this_ptrPointer)
});
    }

    public func set_next_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingLocked>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingLocked_set_next_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> FundingLocked {
    	
        return FundingLocked(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked_clone(origPointer)
});
    }

					internal func danglingClone() -> FundingLocked {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_FundingLockedDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_FundingLockedDecodeErrorZ(pointer: FundingLocked_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return FundingLocked_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> FundingLocked {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing FundingLocked \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing FundingLocked \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

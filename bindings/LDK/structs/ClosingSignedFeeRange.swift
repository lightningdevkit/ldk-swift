public class ClosingSignedFeeRange: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKClosingSignedFeeRange?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(min_fee_satoshis_arg: UInt64, max_fee_satoshis_arg: UInt64) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ClosingSignedFeeRange_new(min_fee_satoshis_arg, max_fee_satoshis_arg)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKClosingSignedFeeRange){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_min_fee_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
ClosingSignedFeeRange_get_min_fee_satoshis(this_ptrPointer)
};
    }

    public func set_min_fee_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSignedFeeRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSignedFeeRange_set_min_fee_satoshis(this_ptrPointer, val);
    }

    public func get_max_fee_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
ClosingSignedFeeRange_get_max_fee_satoshis(this_ptrPointer)
};
    }

    public func set_max_fee_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSignedFeeRange>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSignedFeeRange_set_max_fee_satoshis(this_ptrPointer, val);
    }

    public func clone() -> ClosingSignedFeeRange {
    	
        return ClosingSignedFeeRange(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
ClosingSignedFeeRange_clone(origPointer)
});
    }

					internal func danglingClone() -> ClosingSignedFeeRange {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKClosingSignedFeeRange>) in
ClosingSignedFeeRange_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ClosingSignedFeeRangeDecodeErrorZ(pointer: ClosingSignedFeeRange_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ClosingSignedFeeRange_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ClosingSignedFeeRange {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ClosingSignedFeeRange \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ClosingSignedFeeRange \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

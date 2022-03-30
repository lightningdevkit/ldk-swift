public class UpdateFee: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKUpdateFee?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], feerate_per_kw_arg: UInt32) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = UpdateFee_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), feerate_per_kw_arg)
        super.init(conflictAvoidingVariableName: 0)
        /* POST_INIT_ANCHORING */
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUpdateFee){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKUpdateFee, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFee>) in
UpdateFee_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFee_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_feerate_per_kw() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFee>) in
UpdateFee_get_feerate_per_kw(this_ptrPointer)
};
    }

    public func set_feerate_per_kw(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFee>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFee_set_feerate_per_kw(this_ptrPointer, val);
    }

    public func clone() -> UpdateFee {
    	
        return UpdateFee(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFee>) in
UpdateFee_clone(origPointer)
});
    }

					internal func danglingClone() -> UpdateFee {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFee>) in
UpdateFee_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UpdateFeeDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_UpdateFeeDecodeErrorZ(pointer: UpdateFee_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return UpdateFee_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UpdateFee {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing UpdateFee \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UpdateFee \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}

public class FundingLocked {

    var cOpaqueStruct: LDKFundingLocked?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	
        self.cOpaqueStruct = FundingLocked_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingLocked){
		self.cOpaqueStruct = pointer
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

    public func clone(orig: FundingLocked) -> FundingLocked {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked(pointer: FundingLocked_clone(origPointer))
};
    }

    public func write(obj: FundingLocked) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKFundingLocked>) in
FundingLocked_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_FundingLockedDecodeErrorZ {
    	
        return Result_FundingLockedDecodeErrorZ(pointer: FundingLocked_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		FundingLocked_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

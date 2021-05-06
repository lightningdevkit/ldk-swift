public class FundingLocked {

    var cOpaqueStruct: LDKFundingLocked?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_next_per_commitment_point_arg = Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg)
        self.cOpaqueStruct = FundingLocked_new(converted_channel_id_arg, converted_next_per_commitment_point_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingLocked){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_get_channel_id(this_ptrPointer).pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_next_per_commitment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: FundingLocked_get_next_per_commitment_point(this_ptrPointer));
    }

    public func set_next_per_commitment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked_set_next_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone(orig: FundingLocked) -> FundingLocked {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return FundingLocked(pointer: FundingLocked_clone(origPointer));
    }

    public func write(obj: FundingLocked) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingLocked>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: FundingLocked_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_FundingLockedDecodeErrorZ {
    	
        return Result_FundingLockedDecodeErrorZ(pointer: FundingLocked_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		FundingLocked_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

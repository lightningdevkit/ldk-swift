public class FundingCreated {

    var cOpaqueStruct: LDKFundingCreated?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(temporary_channel_id_arg: [UInt8], funding_txid_arg: [UInt8], funding_output_index_arg: UInt16, signature_arg: [UInt8]) {
    	
		let converted_temporary_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id_arg)
		let converted_funding_txid_arg = Bindings.new_LDKThirtyTwoBytes(array: funding_txid_arg)
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = FundingCreated_new(converted_temporary_channel_id_arg, converted_funding_txid_arg, funding_output_index_arg, converted_signature_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingCreated){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_temporary_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_temporary_channel_id(this_ptrPointer).pointee;
    }

    public func set_temporary_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_temporary_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_funding_txid() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_funding_txid(this_ptrPointer).pointee;
    }

    public func set_funding_txid(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_funding_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_funding_output_index() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_get_funding_output_index(this_ptrPointer);
    }

    public func set_funding_output_index(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_funding_output_index(this_ptrPointer, val);
    }

    public func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: FundingCreated_get_signature(this_ptrPointer));
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func clone(orig: FundingCreated) -> FundingCreated {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return FundingCreated(pointer: FundingCreated_clone(origPointer));
    }

    public func write(obj: FundingCreated) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFundingCreated>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: FundingCreated_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: FundingCreated_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		FundingCreated_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

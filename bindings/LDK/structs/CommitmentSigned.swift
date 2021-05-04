class CommitmentSigned {

    var cOpaqueStruct: LDKCommitmentSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channel_id_arg: [UInt8], signature_arg: [UInt8], htlc_signatures_arg: [[UInt8]]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
		let converted_htlc_signatures_arg = Bindings.new_LDKCVec_SignatureZ(array: htlc_signatures_arg)
        self.cOpaqueStruct = CommitmentSigned_new(converted_channel_id_arg, converted_signature_arg, converted_htlc_signatures_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKCommitmentSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: CommitmentSigned_get_signature(this_ptrPointer));
    }

    func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    func set_htlc_signatures(val: [[UInt8]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_htlc_signatures(this_ptrPointer, Bindings.new_LDKCVec_SignatureZ(array: val));
    }

    func clone(orig: CommitmentSigned) -> CommitmentSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned(pointer: CommitmentSigned_clone(origPointer));
    }

    func write(obj: CommitmentSigned) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: CommitmentSigned_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_CommitmentSignedDecodeErrorZ {
    	
        return Result_CommitmentSignedDecodeErrorZ(pointer: CommitmentSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		CommitmentSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

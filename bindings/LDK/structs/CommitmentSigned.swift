class CommitmentSigned {

    var cOpaqueStruct: LDKCommitmentSigned?;

    init(channel_id_arg: [U], signature_arg: [U], htlc_signatures_arg: [[U]]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = CommitmentSigned_new(channel_id_arg, signature_arg, htlc_signatures_arg)
    }

    private init(pointer: LDKCommitmentSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_channel_id(this_ptrPointer, val);
    }

    func get_signature() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_get_signature(this_ptrPointer);
    }

    func set_signature(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_signature(this_ptrPointer, val);
    }

    func set_htlc_signatures(val: [[U]]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_set_htlc_signatures(this_ptrPointer, val);
    }

    func clone(orig: CommitmentSigned) -> CommitmentSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned(pointer: CommitmentSigned_clone(origPointer));
    }

    func write(obj: CommitmentSigned) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKCommitmentSigned>) in
							
			pointer
						
		}
					
        return CommitmentSigned_write(objPointer);
    }

    func read(ser: [U]) -> Result_CommitmentSignedDecodeErrorZ {
    	
        return CommitmentSigned_read(ser);
    }

				
	deinit {
					
					
		CommitmentSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

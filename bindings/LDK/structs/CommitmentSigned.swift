public class CommitmentSigned {

    var cOpaqueStruct: LDKCommitmentSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], signature_arg: [UInt8], htlc_signatures_arg: [[UInt8]]) {
    	
        self.cOpaqueStruct = CommitmentSigned_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKSignature(array: signature_arg), Bindings.new_LDKCVec_SignatureZ(array: htlc_signatures_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCommitmentSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentSigned>) in
CommitmentSigned_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentSigned>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return CommitmentSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKCommitmentSigned>) in
CommitmentSigned_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentSigned>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return CommitmentSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func set_htlc_signatures(val: [[UInt8]]) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKCommitmentSigned>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return CommitmentSigned_set_htlc_signatures(this_ptrPointer, Bindings.new_LDKCVec_SignatureZ(array: val));
    }

    public func clone(orig: CommitmentSigned) -> CommitmentSigned {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCommitmentSigned>) in
CommitmentSigned(pointer: CommitmentSigned_clone(origPointer))
};
    }

    public func write(obj: CommitmentSigned) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCommitmentSigned>) in
CommitmentSigned_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_CommitmentSignedDecodeErrorZ {
    	
        return Result_CommitmentSignedDecodeErrorZ(pointer: CommitmentSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		CommitmentSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

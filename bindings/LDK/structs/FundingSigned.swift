public class FundingSigned {

    var cOpaqueStruct: LDKFundingSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], signature_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = FundingSigned_new(converted_channel_id_arg, converted_signature_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingSigned>) in
FundingSigned_get_channel_id(this_ptrPointer)
}.pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
FundingSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_signature() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingSigned>) in
FundingSigned_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
FundingSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val))
};
    }

    public func clone(orig: FundingSigned) -> FundingSigned {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFundingSigned>) in
FundingSigned(pointer: FundingSigned_clone(origPointer))
};
    }

    public func write(obj: FundingSigned) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKFundingSigned>) in
FundingSigned_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_FundingSignedDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_FundingSignedDecodeErrorZ(pointer: FundingSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		FundingSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

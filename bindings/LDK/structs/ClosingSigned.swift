public class ClosingSigned {

    public internal(set) var cOpaqueStruct: LDKClosingSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], fee_satoshis_arg: UInt64, signature_arg: [UInt8]) {
    	
        self.cOpaqueStruct = ClosingSigned_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), fee_satoshis_arg, Bindings.new_LDKSignature(array: signature_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKClosingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_fee_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_fee_satoshis(this_ptrPointer)
};
    }

    public func set_fee_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_fee_satoshis(this_ptrPointer, val);
    }

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func clone(orig: ClosingSigned) -> ClosingSigned {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned(pointer: ClosingSigned_clone(origPointer))
};
    }

    public func write(obj: ClosingSigned) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: ClosingSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ClosingSigned_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

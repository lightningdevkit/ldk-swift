public class ClosingSigned {

    var cOpaqueStruct: LDKClosingSigned?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], fee_satoshis_arg: UInt64, signature_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_signature_arg = Bindings.new_LDKSignature(array: signature_arg)
        self.cOpaqueStruct = ClosingSigned_new(converted_channel_id_arg, fee_satoshis_arg, converted_signature_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKClosingSigned){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_get_channel_id(this_ptrPointer).pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_fee_satoshis() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_get_fee_satoshis(this_ptrPointer);
    }

    public func set_fee_satoshis(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_fee_satoshis(this_ptrPointer, val);
    }

    public func get_signature() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKSignature_to_array(nativeType: ClosingSigned_get_signature(this_ptrPointer));
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func clone(orig: ClosingSigned) -> ClosingSigned {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return ClosingSigned(pointer: ClosingSigned_clone(origPointer));
    }

    public func write(obj: ClosingSigned) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKClosingSigned>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ClosingSigned_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: ClosingSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ClosingSigned_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

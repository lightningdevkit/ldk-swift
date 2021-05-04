class RevokeAndACK {

    var cOpaqueStruct: LDKRevokeAndACK?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channel_id_arg: [UInt8], per_commitment_secret_arg: [UInt8], next_per_commitment_point_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_per_commitment_secret_arg = Bindings.new_LDKThirtyTwoBytes(array: per_commitment_secret_arg)
		let converted_next_per_commitment_point_arg = Bindings.new_LDKPublicKey(array: next_per_commitment_point_arg)
        self.cOpaqueStruct = RevokeAndACK_new(converted_channel_id_arg, converted_per_commitment_secret_arg, converted_next_per_commitment_point_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKRevokeAndACK){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_per_commitment_secret() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_get_per_commitment_secret(this_ptrPointer).pointee;
    }

    func set_per_commitment_secret(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_per_commitment_secret(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_next_per_commitment_point() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return Bindings.LDKPublicKey_to_array(nativeType: RevokeAndACK_get_next_per_commitment_point(this_ptrPointer));
    }

    func set_next_per_commitment_point(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_next_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    func clone(orig: RevokeAndACK) -> RevokeAndACK {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK(pointer: RevokeAndACK_clone(origPointer));
    }

    func write(obj: RevokeAndACK) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: RevokeAndACK_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_RevokeAndACKDecodeErrorZ {
    	
        return Result_RevokeAndACKDecodeErrorZ(pointer: RevokeAndACK_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		RevokeAndACK_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class RevokeAndACK {

    var cOpaqueStruct: LDKRevokeAndACK?;

    init(channel_id_arg: [U], per_commitment_secret_arg: [U], next_per_commitment_point_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = RevokeAndACK_new(channel_id_arg, per_commitment_secret_arg, next_per_commitment_point_arg)
    }

    private init(pointer: LDKRevokeAndACK){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_channel_id(this_ptrPointer, val);
    }

    func get_per_commitment_secret() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_get_per_commitment_secret(this_ptrPointer);
    }

    func set_per_commitment_secret(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_per_commitment_secret(this_ptrPointer, val);
    }

    func get_next_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_get_next_per_commitment_point(this_ptrPointer);
    }

    func set_next_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_set_next_per_commitment_point(this_ptrPointer, val);
    }

    func clone(orig: RevokeAndACK) -> RevokeAndACK {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK(pointer: RevokeAndACK_clone(origPointer));
    }

    func write(obj: RevokeAndACK) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRevokeAndACK>) in
							
			pointer
						
		}
					
        return RevokeAndACK_write(objPointer);
    }

    func read(ser: [U]) -> Result_RevokeAndACKDecodeErrorZ {
    	
        return RevokeAndACK_read(ser);
    }

				
	deinit {
					
					
		RevokeAndACK_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

class WatchedOutput {

    var cOpaqueStruct: LDKWatchedOutput?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(block_hash_arg: [UInt8], outpoint_arg: OutPoint, script_pubkey_arg: [UInt8]) {
    	
		let converted_block_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: block_hash_arg)
		let converted_script_pubkey_arg = Bindings.new_LDKCVec_u8Z(array: script_pubkey_arg)
        self.cOpaqueStruct = WatchedOutput_new(converted_block_hash_arg, outpoint_arg.cOpaqueStruct!, converted_script_pubkey_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKWatchedOutput){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_block_hash() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: WatchedOutput_get_block_hash(this_ptrPointer));
    }

    func set_block_hash(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return WatchedOutput_set_block_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_outpoint() -> OutPoint {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: WatchedOutput_get_outpoint(this_ptrPointer));
    }

    func set_outpoint(val: OutPoint) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return WatchedOutput_set_outpoint(this_ptrPointer, val.cOpaqueStruct!);
    }

    func get_script_pubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return Bindings.LDKu8slice_to_array(nativeType: WatchedOutput_get_script_pubkey(this_ptrPointer));
    }

    func set_script_pubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKWatchedOutput>) in
							
			pointer
						
		}
					
        return WatchedOutput_set_script_pubkey(this_ptrPointer, Bindings.new_LDKCVec_u8Z(array: val));
    }

				
	deinit {
					
					
		WatchedOutput_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

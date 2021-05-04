class Shutdown {

    var cOpaqueStruct: LDKShutdown?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(channel_id_arg: [UInt8], scriptpubkey_arg: [UInt8]) {
    	
		let converted_channel_id_arg = Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg)
		let converted_scriptpubkey_arg = Bindings.new_LDKCVec_u8Z(array: scriptpubkey_arg)
        self.cOpaqueStruct = Shutdown_new(converted_channel_id_arg, converted_scriptpubkey_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKShutdown){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_get_channel_id(this_ptrPointer).pointee;
    }

    func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    func get_scriptpubkey() -> [UInt8] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Bindings.LDKu8slice_to_array(nativeType: Shutdown_get_scriptpubkey(this_ptrPointer));
    }

    func set_scriptpubkey(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_set_scriptpubkey(this_ptrPointer, Bindings.new_LDKCVec_u8Z(array: val));
    }

    func clone(orig: Shutdown) -> Shutdown {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown(pointer: Shutdown_clone(origPointer));
    }

    func write(obj: Shutdown) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Shutdown_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ShutdownDecodeErrorZ {
    	
        return Result_ShutdownDecodeErrorZ(pointer: Shutdown_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Shutdown_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

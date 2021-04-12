class Shutdown {

    var cOpaqueStruct: LDKShutdown?;

    init(channel_id_arg: [U], scriptpubkey_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = Shutdown_new(channel_id_arg, scriptpubkey_arg)
    }

    private init(pointer: LDKShutdown){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_channel_id() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_get_channel_id(this_ptrPointer);
    }

    func set_channel_id(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_set_channel_id(this_ptrPointer, val);
    }

    func get_scriptpubkey() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_get_scriptpubkey(this_ptrPointer);
    }

    func set_scriptpubkey(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_set_scriptpubkey(this_ptrPointer, val);
    }

    func clone(orig: Shutdown) -> Shutdown {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown(pointer: Shutdown_clone(origPointer));
    }

    func write(obj: Shutdown) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKShutdown>) in
							
			pointer
						
		}
					
        return Shutdown_write(objPointer);
    }

    func read(ser: [U]) -> Result_ShutdownDecodeErrorZ {
    	
        return Shutdown_read(ser);
    }

				
	deinit {
					
					
		Shutdown_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

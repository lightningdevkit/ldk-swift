class Ping {

    var cOpaqueStruct: LDKPing?;

    init(ponglen_arg: U, byteslen_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = Ping_new(ponglen_arg, byteslen_arg)
    }

    private init(pointer: LDKPing){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_ponglen() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_ponglen(this_ptrPointer);
    }

    func set_ponglen(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_set_ponglen(this_ptrPointer, val);
    }

    func get_byteslen() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_byteslen(this_ptrPointer);
    }

    func set_byteslen(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_set_byteslen(this_ptrPointer, val);
    }

    func clone(orig: Ping) -> Ping {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping(pointer: Ping_clone(origPointer));
    }

    func write(obj: Ping) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_write(objPointer);
    }

    func read(ser: [U]) -> Result_PingDecodeErrorZ {
    	
        return Ping_read(ser);
    }

				
	deinit {
					
					
		Ping_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

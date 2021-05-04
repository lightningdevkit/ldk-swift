class Ping {

    var cOpaqueStruct: LDKPing?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(ponglen_arg: UInt16, byteslen_arg: UInt16) {
    	
        self.cOpaqueStruct = Ping_new(ponglen_arg, byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKPing){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_ponglen() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_ponglen(this_ptrPointer);
    }

    func set_ponglen(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_set_ponglen(this_ptrPointer, val);
    }

    func get_byteslen() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_byteslen(this_ptrPointer);
    }

    func set_byteslen(val: UInt16) -> Void {
    	
						
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

    func write(obj: Ping) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Ping_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: Ping_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Ping_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

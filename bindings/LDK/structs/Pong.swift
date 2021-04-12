class Pong {

    var cOpaqueStruct: LDKPong?;

    init(byteslen_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = Pong_new(byteslen_arg)
    }

    private init(pointer: LDKPong){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_byteslen() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong_get_byteslen(this_ptrPointer);
    }

    func set_byteslen(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong_set_byteslen(this_ptrPointer, val);
    }

    func clone(orig: Pong) -> Pong {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong(pointer: Pong_clone(origPointer));
    }

    func write(obj: Pong) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong_write(objPointer);
    }

    func read(ser: [U]) -> Result_PongDecodeErrorZ {
    	
        return Pong_read(ser);
    }

				
	deinit {
					
					
		Pong_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

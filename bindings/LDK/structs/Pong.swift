public class Pong {

    var cOpaqueStruct: LDKPong?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(byteslen_arg: UInt16) {
    	
        self.cOpaqueStruct = Pong_new(byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPong){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_byteslen() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong_get_byteslen(this_ptrPointer);
    }

    public func set_byteslen(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong_set_byteslen(this_ptrPointer, val);
    }

    public func clone(orig: Pong) -> Pong {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Pong(pointer: Pong_clone(origPointer));
    }

    public func write(obj: Pong) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPong>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Pong_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_PongDecodeErrorZ {
    	
        return Result_PongDecodeErrorZ(pointer: Pong_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Pong_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

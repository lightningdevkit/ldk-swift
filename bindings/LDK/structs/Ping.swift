public class Ping {

    var cOpaqueStruct: LDKPing?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(ponglen_arg: UInt16, byteslen_arg: UInt16) {
    	
        self.cOpaqueStruct = Ping_new(ponglen_arg, byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPing){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_ponglen() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_ponglen(this_ptrPointer);
    }

    public func set_ponglen(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_set_ponglen(this_ptrPointer, val);
    }

    public func get_byteslen() -> UInt16 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_get_byteslen(this_ptrPointer);
    }

    public func set_byteslen(val: UInt16) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping_set_byteslen(this_ptrPointer, val);
    }

    public func clone(orig: Ping) -> Ping {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Ping(pointer: Ping_clone(origPointer));
    }

    public func write(obj: Ping) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPing>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Ping_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: Ping_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Ping_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

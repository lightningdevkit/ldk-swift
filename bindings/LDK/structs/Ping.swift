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
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_ponglen(this_ptrPointer)
};
    }

    public func set_ponglen(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKPing>) in
Ping_set_ponglen(this_ptrPointer, val)
};
    }

    public func get_byteslen() -> UInt16 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_byteslen(this_ptrPointer)
};
    }

    public func set_byteslen(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKPing>) in
Ping_set_byteslen(this_ptrPointer, val)
};
    }

    public func clone(orig: Ping) -> Ping {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPing>) in
Ping(pointer: Ping_clone(origPointer))
};
    }

    public func write(obj: Ping) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPing>) in
Ping_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_PingDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_PingDecodeErrorZ(pointer: Ping_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Ping_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

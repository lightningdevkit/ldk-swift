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
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPong>) in
Pong_get_byteslen(this_ptrPointer)
};
    }

    public func set_byteslen(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKPong>) in
Pong_set_byteslen(this_ptrPointer, val)
};
    }

    public func clone(orig: Pong) -> Pong {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPong>) in
Pong(pointer: Pong_clone(origPointer))
};
    }

    public func write(obj: Pong) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPong>) in
Pong_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_PongDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_PongDecodeErrorZ(pointer: Pong_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Pong_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

public class OutPoint {

    var cOpaqueStruct: LDKOutPoint?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(txid_arg: [UInt8], index_arg: UInt16) {
    	
		let converted_txid_arg = Bindings.new_LDKThirtyTwoBytes(array: txid_arg)
        self.cOpaqueStruct = OutPoint_new(converted_txid_arg, index_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKOutPoint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_txid() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_txid(this_ptrPointer)
}.pointee;
    }

    public func set_txid(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKOutPoint>) in
OutPoint_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_index() -> UInt16 {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_index(this_ptrPointer)
};
    }

    public func set_index(val: UInt16) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKOutPoint>) in
OutPoint_set_index(this_ptrPointer, val)
};
    }

    public func clone(orig: OutPoint) -> OutPoint {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKOutPoint>) in
OutPoint(pointer: OutPoint_clone(origPointer))
};
    }

    public func to_channel_id(this_arg: OutPoint) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_to_channel_id(this_argPointer)
});
    }

    public func write(obj: OutPoint) -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_OutPointDecodeErrorZ {
    	/* NATIVE_CALL_PREP */
        return Result_OutPointDecodeErrorZ(pointer: OutPoint_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		OutPoint_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

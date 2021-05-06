public class WatchedOutput {

    var cOpaqueStruct: LDKWatchedOutput?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(block_hash_arg: [UInt8], outpoint_arg: OutPoint, script_pubkey_arg: [UInt8]) {
    	
		let converted_block_hash_arg = Bindings.new_LDKThirtyTwoBytes(array: block_hash_arg)
		let converted_script_pubkey_arg = Bindings.new_LDKCVec_u8Z(array: script_pubkey_arg)
        self.cOpaqueStruct = WatchedOutput_new(converted_block_hash_arg, outpoint_arg.cOpaqueStruct!, converted_script_pubkey_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKWatchedOutput){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_block_hash() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_block_hash(this_ptrPointer)
});
    }

    public func set_block_hash(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
WatchedOutput_set_block_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_outpoint() -> OutPoint {
    	/* NATIVE_CALL_PREP */
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_outpoint(this_ptrPointer)
});
    }

    public func set_outpoint(val: OutPoint) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
WatchedOutput_set_outpoint(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_script_pubkey() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_script_pubkey(this_ptrPointer)
});
    }

    public func set_script_pubkey(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKWatchedOutput>) in
WatchedOutput_set_script_pubkey(this_ptrPointer, Bindings.new_LDKCVec_u8Z(array: val))
};
    }

				
	deinit {
					
					
		WatchedOutput_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

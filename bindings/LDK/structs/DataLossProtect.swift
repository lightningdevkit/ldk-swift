public class DataLossProtect {

    var cOpaqueStruct: LDKDataLossProtect?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(your_last_per_commitment_secret_arg: [UInt8], my_current_per_commitment_point_arg: [UInt8]) {
    	
		let converted_your_last_per_commitment_secret_arg = Bindings.new_LDKThirtyTwoBytes(array: your_last_per_commitment_secret_arg)
		let converted_my_current_per_commitment_point_arg = Bindings.new_LDKPublicKey(array: my_current_per_commitment_point_arg)
        self.cOpaqueStruct = DataLossProtect_new(converted_your_last_per_commitment_secret_arg, converted_my_current_per_commitment_point_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKDataLossProtect){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_your_last_per_commitment_secret() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect_get_your_last_per_commitment_secret(this_ptrPointer)
}.pointee;
    }

    public func set_your_last_per_commitment_secret(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKDataLossProtect>) in
DataLossProtect_set_your_last_per_commitment_secret(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val))
};
    }

    public func get_my_current_per_commitment_point() -> [UInt8] {
    	/* NATIVE_CALL_PREP */
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect_get_my_current_per_commitment_point(this_ptrPointer)
});
    }

    public func set_my_current_per_commitment_point(val: [UInt8]) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKDataLossProtect>) in
DataLossProtect_set_my_current_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val))
};
    }

    public func clone(orig: DataLossProtect) -> DataLossProtect {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect(pointer: DataLossProtect_clone(origPointer))
};
    }

				
	deinit {
					
					
		DataLossProtect_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

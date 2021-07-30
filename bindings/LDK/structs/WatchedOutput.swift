public class WatchedOutput {

    public internal(set) var cOpaqueStruct: LDKWatchedOutput?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(block_hash_arg: [UInt8], outpoint_arg: OutPoint, script_pubkey_arg: [UInt8]) {
    	
        self.cOpaqueStruct = WatchedOutput_new(Bindings.new_LDKThirtyTwoBytes(array: block_hash_arg), outpoint_arg.cOpaqueStruct!, Bindings.new_LDKCVec_u8Z(array: script_pubkey_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKWatchedOutput){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_block_hash() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_block_hash(this_ptrPointer)
});
    }

    public func set_block_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKWatchedOutput>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return WatchedOutput_set_block_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_outpoint() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_outpoint(this_ptrPointer)
});
    }

    public func set_outpoint(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKWatchedOutput>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return WatchedOutput_set_outpoint(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_script_pubkey() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_get_script_pubkey(this_ptrPointer)
});
    }

    public func set_script_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKWatchedOutput>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return WatchedOutput_set_script_pubkey(this_ptrPointer, Bindings.new_LDKCVec_u8Z(array: val));
    }

    public func clone() -> WatchedOutput {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput(pointer: WatchedOutput_clone(origPointer))
};
    }

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKWatchedOutput>) in
WatchedOutput_hash(oPointer)
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		WatchedOutput_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

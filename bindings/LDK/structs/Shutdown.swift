public class Shutdown {

    public internal(set) var cOpaqueStruct: LDKShutdown?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], scriptpubkey_arg: [UInt8]) {
    	
        self.cOpaqueStruct = Shutdown_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), Bindings.new_LDKCVec_u8Z(array: scriptpubkey_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKShutdown){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKShutdown>) in
Shutdown_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKShutdown>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Shutdown_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_scriptpubkey() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKShutdown>) in
Shutdown_get_scriptpubkey(this_ptrPointer)
});
    }

    public func set_scriptpubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKShutdown>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Shutdown_set_scriptpubkey(this_ptrPointer, Bindings.new_LDKCVec_u8Z(array: val));
    }

    public func clone() -> Shutdown {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKShutdown>) in
Shutdown(pointer: Shutdown_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKShutdown>) in
Shutdown_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ShutdownDecodeErrorZ {
    	
        return Result_ShutdownDecodeErrorZ(pointer: Shutdown_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		Shutdown_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

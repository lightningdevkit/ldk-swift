public class UpdateFailHTLC {

    var cOpaqueStruct: LDKUpdateFailHTLC?;

	

    public init(pointer: LDKUpdateFailHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFailHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_htlc_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_get_htlc_id(this_ptrPointer)
};
    }

    public func set_htlc_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFailHTLC_set_htlc_id(this_ptrPointer, val);
    }

    public func clone(orig: UpdateFailHTLC) -> UpdateFailHTLC {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC(pointer: UpdateFailHTLC_clone(origPointer))
};
    }

    public func write(obj: UpdateFailHTLC) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFailHTLC>) in
UpdateFailHTLC_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_UpdateFailHTLCDecodeErrorZ {
    	
        return Result_UpdateFailHTLCDecodeErrorZ(pointer: UpdateFailHTLC_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		UpdateFailHTLC_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}

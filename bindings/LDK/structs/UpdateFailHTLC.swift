public class UpdateFailHTLC {

    var cOpaqueStruct: LDKUpdateFailHTLC?;

	

    public init(pointer: LDKUpdateFailHTLC){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> (UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8) {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_get_channel_id(this_ptrPointer).pointee;
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_htlc_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_get_htlc_id(this_ptrPointer);
    }

    public func set_htlc_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC_set_htlc_id(this_ptrPointer, val);
    }

    public func clone(orig: UpdateFailHTLC) -> UpdateFailHTLC {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return UpdateFailHTLC(pointer: UpdateFailHTLC_clone(origPointer));
    }

    public func write(obj: UpdateFailHTLC) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKUpdateFailHTLC>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: UpdateFailHTLC_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_UpdateFailHTLCDecodeErrorZ {
    	
        return Result_UpdateFailHTLCDecodeErrorZ(pointer: UpdateFailHTLC_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		UpdateFailHTLC_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

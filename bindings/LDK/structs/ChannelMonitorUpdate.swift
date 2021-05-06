public class ChannelMonitorUpdate {

    var cOpaqueStruct: LDKChannelMonitorUpdate?;

	

    public init(pointer: LDKChannelMonitorUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_update_id() -> UInt64 {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate_get_update_id(this_ptrPointer);
    }

    public func set_update_id(val: UInt64) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate_set_update_id(this_ptrPointer, val);
    }

    public func clone(orig: ChannelMonitorUpdate) -> ChannelMonitorUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate(pointer: ChannelMonitorUpdate_clone(origPointer));
    }

    public func write(obj: ChannelMonitorUpdate) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelMonitorUpdate_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: ChannelMonitorUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelMonitorUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

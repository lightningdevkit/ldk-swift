class ChannelMonitorUpdate {

    var cOpaqueStruct: LDKChannelMonitorUpdate?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKChannelMonitorUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_update_id() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate_get_update_id(this_ptrPointer);
    }

    func set_update_id(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate_set_update_id(this_ptrPointer, val);
    }

    func clone(orig: ChannelMonitorUpdate) -> ChannelMonitorUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate(pointer: ChannelMonitorUpdate_clone(origPointer));
    }

    func write(obj: ChannelMonitorUpdate) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
        return ChannelMonitorUpdate_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
        return ChannelMonitorUpdate_read(ser);
    }

				
	deinit {
					
					
		ChannelMonitorUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

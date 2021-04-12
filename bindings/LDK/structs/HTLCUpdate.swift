class HTLCUpdate {

    var cOpaqueStruct: LDKHTLCUpdate?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKHTLCUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: HTLCUpdate) -> HTLCUpdate {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCUpdate>) in
							
			pointer
						
		}
					
        return HTLCUpdate(pointer: HTLCUpdate_clone(origPointer));
    }

    func write(obj: HTLCUpdate) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKHTLCUpdate>) in
							
			pointer
						
		}
					
        return HTLCUpdate_write(objPointer);
    }

    func read(ser: [U]) -> Result_HTLCUpdateDecodeErrorZ {
    	
        return HTLCUpdate_read(ser);
    }

				
	deinit {
					
					
		HTLCUpdate_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

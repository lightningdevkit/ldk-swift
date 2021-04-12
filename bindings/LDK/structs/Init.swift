class Init {

    var cOpaqueStruct: LDKInit?;

    init(features_arg: InitFeatures) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = Init_new(features_arg)
    }

    private init(pointer: LDKInit){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_features() -> InitFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init_get_features(this_ptrPointer);
    }

    func set_features(val: InitFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init_set_features(this_ptrPointer, val);
    }

    func clone(orig: Init) -> Init {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init(pointer: Init_clone(origPointer));
    }

    func write(obj: Init) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init_write(objPointer);
    }

    func read(ser: [U]) -> Result_InitDecodeErrorZ {
    	
        return Init_read(ser);
    }

				
	deinit {
					
					
		Init_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

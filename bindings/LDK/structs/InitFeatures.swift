class InitFeatures {

    var cOpaqueStruct: LDKInitFeatures?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = InitFeatures_known()
    }

    private init(pointer: LDKInitFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: InitFeatures) -> InitFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInitFeatures>) in
							
			pointer
						
		}
					
        return InitFeatures(pointer: InitFeatures_clone(origPointer));
    }

    func write(obj: InitFeatures) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInitFeatures>) in
							
			pointer
						
		}
					
        return InitFeatures_write(objPointer);
    }

    func read(ser: [U]) -> Result_InitFeaturesDecodeErrorZ {
    	
        return InitFeatures_read(ser);
    }

				
	deinit {
					
					
		InitFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}

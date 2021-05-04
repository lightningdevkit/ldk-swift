class InitFeatures {

    var cOpaqueStruct: LDKInitFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    init() {
    	
        self.cOpaqueStruct = InitFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKInitFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: InitFeatures) -> InitFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInitFeatures>) in
							
			pointer
						
		}
					
        return InitFeatures(pointer: InitFeatures_clone(origPointer));
    }

    func write(obj: InitFeatures) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInitFeatures>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: InitFeatures_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_InitFeaturesDecodeErrorZ {
    	
        return Result_InitFeaturesDecodeErrorZ(pointer: InitFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		InitFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
